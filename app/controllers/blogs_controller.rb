class BlogsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @blogs = Blog.includes(:user).order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(text: blog_params[:text], user_id: current_user.id)
    @blog.save
    if @blog.save
      redirect_to action: :create
    else
      render action: :new
    end
  end

  def destroy
    blog = find_blog_by_id
    if blog.user_id == current_user.id
      blog.destroy
      redirect_to action: :index
    end
  end

  def edit
    @blog = find_blog_by_id
  end

  def update
    blog = find_blog_by_id
    if blog.user.id == current_user.id
    blog.update(blog_params)
    redirect_to action: :index
    end
  end

  def show
    @blog = find_blog_by_id
  end

  private
  def blog_params
    params.require(:blog).permit(:text)
  end

  def find_blog_by_id
    Blog.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
