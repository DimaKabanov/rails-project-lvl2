# frozen_string_literal: true

class Posts::CommentsController < ApplicationController
  def create
    @comment = post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post, notice: t('.success')
    else
      redirect_to post, notice: t('.error')
    end
  end

  private

  def post
    @post ||= Post.find(params[:post_id])
  end

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
