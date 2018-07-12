class Admin::AdminsController < Admin::BackendController
	before_action :authorize_admin
	before_action :setting
	before_action :set_admin, only: [:edit, :update, :destroy]
	layout 'backend'

	def index
		@admins = Admin.all.order("created_at ASC")
		@admin = Admin.new
		respond_to do |format|
			format.html
			format.js
		end
	end

	def edit
	end

	def new
		@admin = Admin.new
	end

	def create
		@admin = Admin.new(admin_params)
		respond_to do |format|
		if @admin.save
			flash[:notice] = 'Admin berhasil di buat'
			redirect_to admin_admins_url
			format.html
			format.js
		else
			flash[:alert] = 'Admin gagal di buat, coba lagi'
			render :new
			format.html
			format.js
		end
	end
	end

	def update
		respond_to do |format|
		if @admin.update(admin_params)
			flash[:notice] = 'Admin berhasil di update'
			redirect_to admin_admins_url
			format.html
			format.js
		else
			render :edit
			format.html
			format.js
		end
	end
	end

	def destroy
		if Admin.count == 1
			flash[:alert] = 'Tidak bisa delete admin pertama'
			redirect_to admin_admins_url
		else
		@admin.destroy
		flash[:notice] = 'Admin berhasil di hapus'
		redirect_to admin_admins_url
	end
	end

	private

	def set_admin
		@admin = Admin.find(params[:id])
	end

	def admin_params
		params.require(:admin).permit(:nama, :email, :password_digest)
	end

end
