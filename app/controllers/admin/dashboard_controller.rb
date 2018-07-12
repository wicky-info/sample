class Admin::DashboardController < Admin::BackendController
  before_action :authorize_admin
  before_action :setting
  layout 'backend'

  def index
  end
  
end
