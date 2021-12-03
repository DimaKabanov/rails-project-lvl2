# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :post_category

  has_many :comments, class_name: 'PostComment'
  has_many :likes, class_name: 'PostLike'

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 50 }
end
