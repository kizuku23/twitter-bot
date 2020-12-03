require 'twitter'
require 'dotenv'
Dotenv.load

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['MY_CONSUMER_KEY']
  config.consumer_secret     = ENV['MY_CONSUMER_SECRET']
  config.access_token        = ENV['MY_ACCESS_TOKEN']
  config.access_token_secret = ENV['MY_ACCESS_TOKEN_SECRET']
end

# 特定のキーワードでツイートを検索して表示
# client.search('#100DaysOfCode').each do|tweet|
#   puts tweet.user.name
#   puts "@#{tweet.user.screen_name}"
#   puts tweet.text
#   puts '*------------------END------------------*'
#   puts "\n"
# end

#特定のキーワードを含む最新のツイートを20件検索し，　いいねする
#:lang => ja で日本語ツイートに絞る
results = client.search('#100DaysOfCode', :count => 20, :result_type => 'recent')
results.attrs[:statuses].each do|tweet|
  id = tweet[:id].to_s
  client.favorite(id)
  puts id
end