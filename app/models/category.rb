class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :ferrari_cars, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  scope :ordered, -> { order(name: :asc) }
end
