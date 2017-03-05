module AuthHelper
  CLIENT_ID = "oikQMCs5TAL9oDhjmlZSBzHlu"
  CLIENT_SECRET = "3HXmXL4Dql6Z70ap7jnEj8FGkEzdVjxCyOxYOIiC6MB4nd6jOg"
  REDIRECT_URI = "http://127.0.0.1:3000/authorize"

  def get_login_url
	client = OAuth::Consumer.new(CLIENT_ID,
								 CLIENT_SECRET,
								 {:site => "https://api.twitter.com",
								  :authorize_path => "/oauth/authorize",
								  :request_token_path => "/oauth/request_token"})
	request_token = client.get_request_token({:oauth_callback => REDIRECT_URI})
	session[:request_token] = request_token.token
	session[:request_token_secret] = request_token.secret

	login_url = request_token.authorize_url(:oauth_callback => REDIRECT_URI)
	#redirect_to request_token.authorize_url(:oauth_callback => REDIRECT_URI)
  end

  #def prepare_access_token(oauth_token, oauth_verifier)
  def prepare_access_token
	client = OAuth::Consumer.new(CLIENT_ID,
								 CLIENT_SECRET,
								 {:site => "https://api.twitter.com",
								  :authorize_path => "/oauth/authorize",
								  :access_token_path => "/oauth/access_token"})
	request_token = OAuth::RequestToken.new(client, session[:request_token], session[:request_token_secret])
	session[:oauth_verifier] = params['oauth_verifier']
	#access_token = client.get_access_token(oauth_token, { :oauth_verifier => oauth_verifier })
	session[:access_token] = request_token.get_access_token(:oauth_verifier => session[:oauth_verifier])
	puts session[:access_token].token
	puts session[:access_token].secret
	token_hash = { :oauth_token => session[:access_token].token, :oauth_token_secret => session[:access_token].secret }
	access_token = OAuth::AccessToken.from_hash(client, token_hash)
	return access_token
  end
end
