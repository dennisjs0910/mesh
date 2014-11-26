class RedditComment < RedditKit::Thing
  attr_reader :user

  def initialize
    create_reddit_comment
  end

  def create_reddit_comment
    @client = RedditKit::Comment.new 
  end

  def display_comments(rlink)
    binding.pry
    @client.body(rlink)
  end
end

# do |config|
#       config.consumer_key        = 'vOsw4t8ygEHS2Q'
#       config.consumer_secret     = 'HjbN35t4g7oOPW0wCp5hBRadTmc'
#       config.access_token        = user.reddit_authentication.token
#       config.access_token_secret = user.reddit_authentication.secret