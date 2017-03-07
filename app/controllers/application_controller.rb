class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  require 'json'

  include AuthHelper

  def twitter_login
    # Display twitter login link
	session[:login_url] = twitter_get_login_url
	redirect_to "/app/login"
  end

  def twitter_authorize
    twitter_prepare_access_token
	response = session[:access_token].request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")
	session[:tweets] = JSON.parse(response.body)
	redirect_to "/app/show"
  end

  def twitter_reload
	response = session[:access_token].request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")
	session[:tweets] = JSON.parse(response.body)
	redirect_to "/app/show"
  end

  def twitter_like
	id = params['id']
	session[:access_token].request(:post, "https://api.twitter.com/1.1/favorites/create.json?id=#{id}")
	response = session[:access_token].request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")
	session[:tweets] = JSON.parse(response.body)
	redirect_to "/app/show"
  end

  def twitter_unlike
	id = params['id']
	session[:access_token].request(:post, "https://api.twitter.com/1.1/favorites/destroy.json?id=#{id}")
	response = session[:access_token].request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")
	session[:tweets] = JSON.parse(response.body)
	redirect_to "/app/show"
  end
end
