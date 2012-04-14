require 'twitter_search_extension'

  client=TwitterSearchExtension.new
  urls= client.get_urls_for_hashtags(ARGV)

  puts "URLs with hashtag(s)=> #{ARGV.join(', ')} :" 
  urls.empty? ? puts("No URL found") : urls.each_with_index {|url,i|   puts (i+1).to_s + '. '  + url}   





