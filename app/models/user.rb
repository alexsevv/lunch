class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :soups
  has_many :cereals
  has_many :drinks

  before_validation :set_name, on: :create

  has_secure_token :token

  before_save :set_admin

  private

  def set_admin
    if User.count == 0
      self.admin = true
    end
  end

  def set_name
    self.name = "User#{rand(999)}" if name.blank?
  end
end
