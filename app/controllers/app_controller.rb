class AppController < ApplicationController
  def show
    @tweets = session[:tweets]
  end
end
