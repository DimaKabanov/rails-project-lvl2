# frozen_string_literal: true

require 'test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @comment = post_comments(:one)
    sign_in users(:one)
    @params = {
      content: Faker::Lorem.sentence(word_count: 30),
      parent_id: nil
    }
  end

  test 'should create comment' do
    post post_comments_path(@post), params: { post_comment: @params }
    assert_redirected_to @post

    follow_redirect!
    assert_select 'p.card-text', @params[:content]
  end
end
