class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  require 'uri'
  require 'cgi'

  include AuthHelper

  def home
    # Display twitter login link
	login_url = get_login_url
	#get_login_url
    render html: "<a href='#{login_url}'>Log in and view Twitter timeline</a>".html_safe
  end

  def authorize
	params = CGI.parse(URI.parse(request.original_url).query)
    token = prepare_access_token(params["oauth_verifier"]
	#response = token.request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")
	#render html: "#{response}".html_safe
  end
end
