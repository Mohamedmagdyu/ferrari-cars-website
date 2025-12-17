class FerrariCar < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :category
  has_one_attached :image

  validates :name, presence: true
  validates :model, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 1900 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :engine, presence: true
  validates :top_speed, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :acceleration, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true, inclusion: { in: %w[available sold reserved] }

  scope :available, -> { where(status: 'available') }
  scope :by_year, -> { order(year: :desc) }
  scope :by_price, -> { order(price: :asc) }
end
