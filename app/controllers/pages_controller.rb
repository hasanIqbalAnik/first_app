class PagesController < ApplicationController
  def home
   @title = "Home"
    @micropost = Micropost.new if signed_in?
    @feed_items = current_user.feed.paginate(:page => params[:paged])
  end

  def contact
    @title = "Contact"
  end
  
  def help
    @title = "Help"
  end
 
  def about
    @title = "About"
  end 
end
