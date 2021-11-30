class Posts::LikesController < ApplicationController
  before_action :set_post

  def create
    @post.post_likes.create(user: current_user)
    redirect_to @post
  end

  def destroy
    @like = @post.post_likes.find_by! user: current_user
    @like.destroy!
    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
