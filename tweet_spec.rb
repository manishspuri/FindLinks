require 'twitter_search_extension'
require 'rspec'

describe TwitterSearchExtension do
  before(:each) do
    @client= TwitterSearchExtension.new
  end
  
  it "check urls" do
   urls = @client.get_urls_for_hashtags(['ror'])
   urls.each do |url|
     url.should match /^http/
    end
  end


end
