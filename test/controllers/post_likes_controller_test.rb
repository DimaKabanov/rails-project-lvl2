# frozen_string_literal: true

require 'test_helper'

class PostLikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @user = users(:one)
    sign_in @user
  end

  test 'should create like' do
    post post_likes_path(@post)
    like = @post.likes.find_by(user_id: @user.id)

    assert { like }
  end

  test 'should destroy like' do
    like = post_likes(:two)

    delete post_like_path(@post, like)

    assert { !@post.likes.find_by(id: like.id) }
  end
end
