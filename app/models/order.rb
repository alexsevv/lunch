class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cereal
  belongs_to :soup
  belongs_to :drink

  validates :user, presence: true
end
