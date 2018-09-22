class UsersController < ApplicationController
  before_action :login_ck, only: [:new, :show]
  def index
    @users =User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def favorites
    @user = User.find(params[:id])
    @favorite_blogs = @user.favorite_blogs
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
  #ログインチェック
  def login_ck
    unless current_user
      flash[:notice] = '失敗しました'
      render new_session_path
    end
  end
  
end
