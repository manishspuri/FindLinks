require 'rubygems'
require "twitterChallenge"

require "test/unit"


class TweetTest < Test::Unit::TestCase

  def test_blank_hashtag
    tweets= TwitterChallenge.get_tweets_for_hashtags
    assert_equal  0, tweets.length 
  end

  def test_tweet_count
    tweets= TwitterChallenge.get_tweets_for_hashtags(['rubyonrails'])
    assert_equal  100, tweets.length

    tweets= TwitterChallenge.get_tweets_for_hashtags(['rubyonrails'],50)
    assert_equal  50,tweets.length
   
  end

  def test_urls
       TwitterChallenge.find_urls_from_tweets(TwitterChallenge.get_tweets_for_hashtags(['ror'])).each do |url|
         assert_match(/^http/, url)
       end
  end
 
 


end
