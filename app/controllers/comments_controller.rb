class CommentsController < ApplicationController
  def create
    @comment = Comment.new comments_param
    @comment.user = current_user
    @comment.blog = Blog.find_by id: params[:comment][:blog_id]

    if @comment.save
      respond_to do |format|
        format.html { redirect_to @comment.blog }
        format.js
      end
    else
      flash[:notice] = "Something went wrong"
    end
  end

  def index
  end

  private
  def comments_param
    params.require(:comment).permit :text, :blog
  end
end
