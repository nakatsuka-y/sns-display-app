class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  require 'json'

  include AuthHelper

  def home
    # Display twitter login link
	login_url = twitter_get_login_url
    render html: "<a href='#{login_url}'>Log in and view Twitter timeline</a>".html_safe
  end

  def twitter_authorize
    twitter_prepare_access_token
	response = session[:access_token].request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")
	session[:tweets] = JSON.parse(response.body)
	redirect_to "/app/show"
  end
end
