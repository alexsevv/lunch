class Soup < ApplicationRecord
  has_many :user, through: :orders

  validates :name, presence: true, length: {maximum: 50}
  validates :price, presence: true, numericality: { greater_than: 0 }

  mount_uploader :photo, PhotoUploader
end
