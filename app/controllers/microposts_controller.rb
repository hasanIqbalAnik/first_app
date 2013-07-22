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
    @mc = Micropost.find_by_id(params[:id])

    @mc.destroy
    redirect_back_or root_path
  end

  def index

      user = User.find_by_id(params[:id])
      @feed_items = user.microposts.paginate(:page => params[:page], per_page: 5)

  end
  private
  def authorize_user
    @micropost = Micropost.find_by_id(params[:id])
    redirect_to root_path unless current_user?(@micropost.user)
  end
end