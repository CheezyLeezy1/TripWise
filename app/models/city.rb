class City < ApplicationRecord
  belongs_to :user
  belongs_to :country
  has_many :activities, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
end

