require 'rubygems'
require 'twitter_search_extension'

require "test/unit"


class TweetTest < Test::Unit::TestCase

  def test_urls
         @client= TwitterSearchExtension.new
         @client.get_urls_for_hashtags(['ror']).each do |url|
         assert_match(/^http/, url)
       end
  end
 
 


end
