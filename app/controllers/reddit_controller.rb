class RedditController < ApplicationController

def index
  @frontpage = reddit_user.front_page
end 

end
