class RedditController < ApplicationController

  def index
    @frontpage = reddit_user.front_page
  end 

  def search 
    @search = reddit_user.reddit_search(params[:search])
  end 

  def upvote
    @downvotes = reddit_user.reddit_upvote(params[:downvoted])
  end 

  def downvote
    @downvotes = reddit_user.reddit_downvote(params[:downvoted])
  end 

  def comments
    @reddit_comments = reddit_user.display_comments(params[:comments])
  end 

end
