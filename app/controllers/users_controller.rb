class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def index
    @user = User.find(current_user.id)
    @users = User.paginate(page: params[:page], per_page: 9)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @users = User.search(params[:search])
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to post_images_path
  end

  def leave
  end

  private 
    def user_params
        params.require(:user).permit(:name, :profile_image)
    end
end

