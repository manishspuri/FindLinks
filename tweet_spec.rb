require 'twitterChallenge'
require 'rspec'

describe TwitterChallenge do
  before(:each) do
    @tweets = TwitterChallenge.get_tweets_for_hashtags(["rubyonrails"])
  end

 it "should return atmost supplied number of tweets"do
     @tweets.should have_at_most(100).things
   
  end


  it "should return tweets wrapped in Twitter::Status class with hashtags" do
    @tweets.first.should be_an_instance_of Twitter::Status     
  end

  it "should check urls from the extracted tweets " do
   urls= TwitterChallenge.find_urls_from_tweets @tweets
   urls.each do |url|
     url.should match /^http/
    end
  end


end
