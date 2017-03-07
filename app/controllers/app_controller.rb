class AppController < ApplicationController
  def show
    @tweets = session[:tweets]
  end
  def login
    @login_url = session[:login_url]
  end
end
