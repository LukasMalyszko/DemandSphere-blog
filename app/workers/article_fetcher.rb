
# class ArticleFetcher
#   include Sidekiq::Worker

#   def perform
#     url = 'https://www.demandsphere.com/feed/'
#     num = 5

#     articles = FeedReader.fetch_articles(url, num)

#     firebase_url = 'demands-sphere-blog.firebaseapp.com'
#     api_key = ENV['API_KEY']

#     firebase = Firebase::Client.new(firebase_url, api_key)


#     articles.each do |article|
#       response = firebase.push('articles', article)
#       puts "Sent article with ID: #{response.body['name']}"
#     end
#   end
# end
