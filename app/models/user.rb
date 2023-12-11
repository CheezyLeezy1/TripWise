# frozen_string_literal: true

# Comment
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :countries
  has_many :cities
  has_many :activities
end
