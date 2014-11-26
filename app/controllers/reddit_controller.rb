class RedditController < ApplicationController

  def index
    @frontpage = reddit_user.front_page
    # @title
  end 

  def search 
    # binding.pry 
    @search = reddit_user.reddit_search(params[:search])
  end 

  def upvote
    # @client = RedditUser.new(current_user)
    # @newclient = @client.create_reddit_client
    # binding.pry
    # @upvotes = @newclient.upvote(params[:upvoted])
    # @reddit_user = RedditUser.new(current_user)
    @upvotes = reddit_user.reddit_upvote(params[:upvote])
    binding.pry
  end 

  def downvote
    @downvotes = reddit_user.reddit_upvote(params[:downvote])
  end 

  def comments
    @reddit_comments = reddit_user.display_comments(params[:comments])
  end 

end
