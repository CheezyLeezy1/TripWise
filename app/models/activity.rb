# frozen_string_literal: true

# Comment
class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
end
