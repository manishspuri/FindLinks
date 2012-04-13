require File.join(File.dirname(__FILE__), 'twitter-search/lib/twitter_search')

class TwitterChallenge
 
#This method returns the tweets based on hashtag or array of hashtags and the no of tweets provideds.
  def self.get_tweets_for_hashtags(hashtags=[],no_of_tweets=100)
   begin 
     tags = hashtags.collect{|tag| "##{tag}"}
     client = TwitterSearch::Client.new
   
      tags.length > 0 ?   client.query(:q => "##{tags}", :rpp => no_of_tweets): []

   rescue
     puts "Something went wrong while fetching tweets" 
     exit
   end
  end

#This method finds the urls from the tweets which are passed as arguments
  def self.find_urls_from_tweets(tweets=[])
    begin 
     urls =[]
     urls << tweets.map{|tweet|  URI.extract(tweet.text,'http') }
     urls.flatten!.uniq!
    rescue 
      puts "Something went wrong while extracting urls from tweets" 
      exit
    end 
  end


end
