# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  has_many :post_comments
  has_many :post_likes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
