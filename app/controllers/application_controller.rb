class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  @title = "Home"

end
