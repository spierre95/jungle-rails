class Admin::DashboardController < ApplicationController
 before_action :require_authentication
def require_authentication
  authenticate_or_request_with_http_basic do |u,p|
      u== ENV['USERNAME'] &&  p == ENV['PASSWORD']
  end
end

  def show
  end
end

