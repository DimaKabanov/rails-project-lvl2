# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @post = posts(:one)
    @params = {
      title: Faker::Lorem.sentence(word_count: 2),
      body: Faker::Lorem.sentence(word_count: 30),
      post_category_id: @post.post_category_id
    }
  end

  test 'should get index' do
    get root_path

    assert_response :success
  end

  test 'should get new' do
    sign_in @user
    get new_post_path

    assert_response :success
  end

  test 'should get show' do
    sign_in @user
    get post_path @post

    assert_response :success
    assert_select 'h2', @post.title
  end

  test 'should create new post' do
    sign_in @user
    post posts_path, params: { post: @params }

    assert_response :redirect
    follow_redirect!
    assert_select 'h2', @params[:title]
  end
end
