class ApplicationController < ActionController::Base
  # for devise authentication and sessions
  before_action :authenticate_user!
end
