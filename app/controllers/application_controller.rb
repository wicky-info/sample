class ApplicationController < ActionController::Base


	def current_admin
		@admin ||= Admin.find(session[:current_admin_id]) if session[:current_admin_id]
	end

	def authorize_admin
		unless current_admin
			redirect_to root_path
		end
	end

	def setting
		@settings = Setting.all
	end

end
