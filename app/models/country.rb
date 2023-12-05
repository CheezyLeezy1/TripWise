# frozen_string_literal: true

# Comment
class Country < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  has_many :cities
  has_many :activities, through: :cities

  validates :title, presence: true
  validates :description, presence: true
end
