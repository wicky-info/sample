class SessionController < ApplicationController
	before_action :authorize_admin, except: [:new, :create]


	def new
		@settings = Setting.all
		if current_admin
			redirect_to admin_dashboard_index_url
		else
			root_path
		end
	end

	def create
		@admin = Admin.find_by(email: params[:email]).try(:authenticate, params[:password])
		if @admin
			session[:current_admin_id] = @admin.id
			flash[:notice] = 'Login berhasil'
			redirect_to admin_dashboard_index_url
		else
			flash[:alert] = 'Login gagal coba lagi'
			redirect_to root_path
		end
	end

	def destroy
		session[:current_admin_id] = nil
		flash[:notice] = 'logout telah berhasil'
		redirect_to root_path
	end

end
