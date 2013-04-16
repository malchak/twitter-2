

get '/' do
  erb :index
end

get '/shit' do
  @user = User.find_or_create_by_username(session[:username])
  if @user.tweets.empty? || @user.tweets_stale?
    @user.fetch_tweets!
  end
  sleep 5
 erb(:tweets, :layout => false)
end

get '/:username' do
  session[:username] = params[:username]
  erb(:index)
end


