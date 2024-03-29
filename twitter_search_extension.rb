require 'rubygems'
require 'twitter_search'

class TwitterSearchExtension < TwitterSearch::Client
 
   
    def get_urls_for_hashtags(hashtags=[],n=100)
        raise RuntimeError, "Please supply atleast one hashtag" if hashtags.empty?
        hashtags.collect!{|tag| "#" + tag }
        tweets = query(:q => "#{hashtags.join(' OR ')}", :rpp => n)
        urls = tweets.map{|tweet|  URI.extract(tweet.text,'http') }
        urls.flatten.uniq  
    end
 
end
