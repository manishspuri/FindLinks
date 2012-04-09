require 'twitterChallenge'

  begin
	if ARGV && !ARGV.empty?
	    tweets=TwitterChallenge.get_tweets_for_hashtags(ARGV,100) #find tweets
            urls= TwitterChallenge.find_urls_from_tweets(tweets) || []     #find urls 
            puts "URLs with hashtag(s)=> #{ARGV.join(', ')} :" 
            urls.empty? ? puts("No URL found") : urls.each_with_index {|url,i|   puts (i+1).to_s + '. '  + url}   
      else
            puts "Please supply atleast one hashtag"
	end
  rescue
    puts 'Something went wrong'
    exit
  end
  




