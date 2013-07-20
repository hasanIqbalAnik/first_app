class PagesController < ApplicationController
  def home
   @title = "Home"
   if signed_in?
     @micropost = Micropost.new
     @feed_items = current_user.feed.paginate(:page => params[:page])
     #@feed_items = Micropost.paginate(:page => params[:page], per_page: 5)
   end

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
