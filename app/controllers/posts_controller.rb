# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to post_path(@post), notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @current_user_like = @post.post_likes.find_by(user: current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_category_id)
  end
end
