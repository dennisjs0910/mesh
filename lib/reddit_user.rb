class RedditUser
  attr_reader :user
  
  def initialize(user)
    @user = user
    create_reddit_client
  end

  def create_reddit_client
    @client = RedditKit::Client.new do |config|
      config.consumer_key        = 'vOsw4t8ygEHS2Q'
      config.consumer_secret     = 'HjbN35t4g7oOPW0wCp5hBRadTmc'
      config.access_token        = user.reddit_authentication.token
      config.access_token_secret = user.reddit_authentication.secret
    end
  end

  def front_page 
    @client.front_page
  end 

  def reddit_search(reddit_search) 
    @client.search(reddit_search)
  end 

  def reddit_upvote(link)
  
    @client.upvote(link)
  end 

  def reddit_downvote(link)
    @client.downvote(link)
  end 

  def display_comments(rlink)
    article_link = @client.link(rlink)
    @client.comments(article_link)
  end 

end