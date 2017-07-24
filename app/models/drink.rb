class Drink < ApplicationRecord
  has_many :user, through: :orders

  validates :name, presence: true, length: {maximum: 50}
  validates :price, presence: true, numericality: { greater_than: 0 }
end
