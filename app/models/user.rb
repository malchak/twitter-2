class User < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
    latest_tweets = Twitter.user_timeline(self.username)
    latest_tweets.each do |tweet|
      tmp_tweet = Tweet.find_or_create_by_tweet_id_and_user_id(tweet.id, self.id)
      tmp_tweet.text = tweet.text
      tmp_tweet.save
    end
  end

  def tweets_stale?
    (Time.now - self.tweets.last.created_at)/60 > 15
  end

end
