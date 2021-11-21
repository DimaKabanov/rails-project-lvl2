# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :post_category

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 50 }
end
