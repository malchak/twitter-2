get '/' do
  erb :index
end

get '/:username' do
  
  @user = User.find_or_create_by_username(params[:username])
  if @user.tweets.empty? || @user.tweets_stale?
    @user.fetch_tweets!
  end


  erb(:tweets)
end
