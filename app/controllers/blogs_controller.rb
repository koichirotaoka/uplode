class BlogsController < ApplicationController
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
    
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to new_blog_path
    else
      render 'new'
    end
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"投稿を削除しました！"
  end
  
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "投稿を編集しました！"
    else
      render 'edit'
    end
  end
  
  
  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:content)
  end
  
  
    
    
end
