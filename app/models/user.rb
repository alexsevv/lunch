class User < ApplicationRecord
  has_many :orders
  has_many :soups
  has_many :cereals
  has_many :drinks

  validates :user, presence: true

  before_validation :set_name, on: :create

  private

  def set_name
    self.name = "User#{rand(999)}" if self.name.blank?
  end
end
