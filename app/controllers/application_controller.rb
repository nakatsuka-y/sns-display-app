class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    render html: '<a href="#">Log in and view Twitter timeline</a>'
  end
end
