  FACEBOOK_KEY = '613501478696216'
  FACEBOOK_SECRET = '30fa2bffedee3c574c45c56fc8ac798e'
  OAUTH_REDIRECT_URL = 'http://localhost:9393/'

get '/' do
  # Look in app/views/index.erb

  # oauth_access_token = 'CAAItZBfG09RgBANZB8CUpJQEtkbBGKw0S8UI6cMbIr0qHXMXkDnH4duLugAAD1QHGHbPlVTwbnwsMUXTw2Mn1reYZCZB8nI4ZB0PbKO4rnq6UAerRZCUlkQ4jOb4uZBjcB27b1v92LlXWOSqzmmjQZCDB5NN9xjZB6TSMP5aSKMestJPNmciJ6qwMXIGuc6FJaL4ZD'

  # @graph = Koala::Facebook::API.new(oauth_access_token)

  # p profile = @graph.get_object("me")
  # p friends = @graph.get_connections("me", "friends")
 #  # p @graph
 #  # p profile
 #  # p friends
 # #  @graph.put_connections("me", "feed", :message => "I am writing on my wall!")

	# # # three-part queries are easy too!
	# # @graph.get_connections("me", "mutualfriends/#{friend_id}")

	# # # you can even use the new Timeline API
	# # # see https://developers.facebook.com/docs/beta/opengraph/tutorial/
	# # @graph.put_connections("me", "namespace:action", :object => object_url)

  # @oauth = Koala::Facebook::OAuth.new(FACEBOOK_KEY, FACEBOOK_SECRET, "http://localhost:9393/auth_fb")
  # @url = @oauth.url_for_oauth_code

  @url = "https://www.facebook.com/dialog/oauth?client_id=#{FACEBOOK_KEY}&redirect_uri=http%3A%2F%2Flocalhost%3A9393%2Fauth_fb"
  p session
  erb :index
end

get '/auth_fb' do
  request_code = params["code"]
  @oauth = Koala::Facebook::OAuth.new(FACEBOOK_KEY, FACEBOOK_SECRET, "http://localhost:9393/auth_fb")
  @access_token = @oauth.get_access_token(request_code)
  @graph = Koala::Facebook::API.new("CAAItZBfG09RgBAGhVmSwR7Uls4K2sX8hiRCxxhmhCKA96j0rJWyfKWKz3MlP1ZB5ZCkHjasyjgcnS0O4eQ4ai8OU0Je0TTxxpAwdzvZCpsRFiVUYo63mKLlIUzCmrR1UPBbip6bN8tzioxZBw41udcCab2ElMA9fp06klOnIs4aucTFXZBt2Mz")
  profile = @graph.get_object("me")
  p profile
  # if User.find_by_fid(profile["id"])
  #   session["id"] = profile["id"]
  #   redirect "logged in"
  # else

  # end

  # User.create(:uid => profile["id"], :access_token => @access_token)
  # p @oauth
  @message = "you are facebooked in #{@access_token}"
    @url = "https://www.facebook.com/dialog/oauth?client_id=#{FACEBOOK_KEY}&redirect_uri=http%3A%2F%2Flocalhost%3A9393%2Fauth_fb"
  erb :index
end

get '/logout' do
  "Not yet logged out!"
end
