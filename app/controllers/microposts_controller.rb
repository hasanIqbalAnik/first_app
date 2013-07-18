class MicropostsController < ApplicationController
  before_filter :authenticate, :once => [:create, :destroy]

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = 'Micropost created!'
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end
  def destroy

  end

  def index

  end
end