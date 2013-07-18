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
    @micropost.destroy
    redirect_back_or root_path
  end

  def index

  end
  private
  def authorize_user
    @micropost = Micropost.find_by_id(params[:id])
    redirect_to root_path unless current_user?(@micropost.user)
  end
end