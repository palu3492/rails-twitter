class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  include Clearance::Authentication

  @title = "Home"

  def authenticate(params)
    puts(params)
    User.authenticate(params[:session][:username],
                      params[:session][:password])
  end

end
