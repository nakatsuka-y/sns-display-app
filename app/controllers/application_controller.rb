class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

<<<<<<< HEAD
  require 'uri'
  require 'cgi'
=======
  #require 'addressable/uri'
  #require 'cgi'
  require 'json'
>>>>>>> receive-tweet

  include AuthHelper

  def home
    # Display twitter login link
	login_url = get_login_url
	#get_login_url
    render html: "<a href='#{login_url}'>Log in and view Twitter timeline</a>".html_safe
  end

  def authorize
<<<<<<< HEAD
	params = CGI.parse(URI.parse(request.original_url).query)
    token = prepare_access_token(params["oauth_verifier"]
	#response = token.request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")
	#render html: "#{response}".html_safe
=======
	#params = Addressable::URI.parse(request.original_url)
	#puts params.query_values["oauth_token"].class
    #token = prepare_access_token(params["oauth_token"], params["oauth_verifier"])
    #prepare_access_token(params.query_values["oauth_token"], params.query_values["oauth_verifier"])
    token = prepare_access_token
	response = token.request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")
	#@tweets = JSON.parse(response.body)
	session[:tweets] = JSON.parse(response.body)
	#render_tweet = "<p>#{tweet["user"]["name"]} - #{tweet["text"]} : #{tweet["favorited"].to_s}</p><br>"
	#tweets.each do |tweet|
	#render html: "<p>#{tweets[1]["user"]["name"]} - #{@tweets[1]["text"]} : #{tweets[1]["favorited"].to_s}</p><br>".html_safe
	#end
	redirect_to "/app/show"
>>>>>>> receive-tweet
  end
end
