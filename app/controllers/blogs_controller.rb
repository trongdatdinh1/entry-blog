class BlogsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def index
    @blogs = Blog.all.ordered_by_date.page params[:page]
  end

  def new
    @blog = current_user.blogs.build
  end

  def create
    @blog = current_user.blogs.build blog_params
    if @blog.save
      flash[:success] = "Blog successfully created"
      redirect_to root_url
    else
      render "blogs/new"
    end
  end

  def show
    @blog = Blog.find_by id: params[:id]
    @comments = @blog.comments.ordered_by_date.page params[:page]
    @comment = @blog.comments.build
  end

  private
  def blog_params
    params.require(:blog).permit :title, :body
  end
end
