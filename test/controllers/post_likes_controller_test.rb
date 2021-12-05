# frozen_string_literal: true

require 'test_helper'

class PostLikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test 'should create like' do
    post = posts(:two)
    assert_difference('post.likes.count') do
      post post_likes_path(post)
    end
  end

  test 'should destroy like' do
    post = posts(:one)
    like = post_likes(:two)
    assert_difference('post.likes.count', -1) do
      delete post_like_path(post, like)
    end
  end
end
