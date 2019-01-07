class StaticPagesController < ApplicationController
  def home
    if current_user
      @blogs = Blog.user_id_in(current_user.following_ids, current_user.id).ordered_by_date.page params[:page]
    end
  end
end
