class Admin::SettingsController < Admin::BackendController
	before_action :authorize_admin
	before_action :setting
	before_action :set_setting, only: [:edit, :update, :destroy]
	layout 'backend'

	def index
		if Setting.any?
			redirect_to edit_admin_setting_url(Setting.first), id: "edit_link", remote: true
		else
		@settings = Setting.all.order("created_at DESC")
		@setting = Setting.new
		respond_to do |format|
			format.html
			format.js
		end
	end
	end

	def show
	end

	def edit
		respond_to do |format|
			format.html
			format.js
		end
		@settings = Setting.all
	end

	def new
		@setting = Setting.new
	end

	def create
		respond_to do |format|
		if setting = Setting.create!(setting_params)
			redirect_to admin_settings_url
			format.html
			format.js
		else
			render :new
			format.html
			format.js
		end
	end
	end

	def update
		respond_to do |format|
		 if @setting.update(setting_params)
			flash[:notice] = 'Setting berhasil di update'
			redirect_to admin_settings_url
			format.js
			format.html
		else
			flash[:alert] = 'Gagal menyimpan setting coba lagi'
			render :edit
			format.js
			format.html
		end
	end
	end

	def destroy
		@setting.destroy
		redirect_to admin_settings_url
	end

	private

	def set_setting
		@setting = Setting.find(params[:id])
	end


	def setting_params
		params.require(:setting).permit(:judul_website, :judul_footer, :background_website, :judul_backend)
	end

end
