class BlogsController < ApplicationController

  def index
    @blogs = Blog.all.order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.save
    if @blog.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:text)
  end
end
