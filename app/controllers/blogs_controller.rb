class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :login_ck, only: [:index, :new, :edit, :show, :destroy]
  def index
    @blogs = Blog.all
  end
  
  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end
  
  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id 
    if @blog.save
      redirect_to blogs_path
    else
      render 'new'
    end
  end
  
  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    render :new if @blog.invalid?
  end
  
  def destroy
    @blog.destroy
    unless @blog.user_id==current_user.id
      flash[:notice] = '失敗しました'
      render new_session_path
    else
      redirect_to blogs_path, notice:"投稿を削除しました！"
    end
  end
  
  def edit
    @blog = Blog.find(params[:id])
    unless @blog.user_id==current_user.id 
      flash[:notice] = '失敗しました'
      render new_session_path
    end
  end
  
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "投稿を編集しました！"
    else
      render 'edit'
    end
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:content)
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
  
  #ログインチェック
  def login_ck
    unless current_user
      flash[:notice] = '失敗しました'
      render new_session_path
    end
  end
  
end
