# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :post_category
  has_many :post_comments

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 50 }
end
