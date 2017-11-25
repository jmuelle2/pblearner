class ApplicationController < ActionController::Base
  before_action :authenticate_instructor!

  protect_from_forgery with: :exception
end
