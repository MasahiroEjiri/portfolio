class UsersController < ApplicationController
 before_action :require_user_logged_in, only: [:index, :show, :likes]

  def index
    @pagy, @users = pagy(User.order(id: :desc), items: 25)
  end

  def show
    @user = User.find(params[:id])
     @pagy, @topics = pagy(@user.topics.order(id: :desc))
  end

  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def likes
    @user = User.find(params[:id])
    @pagy, @topics = pagy(@user.favoriting.order(id: :desc))
  end
  
  
  
  
private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
