class User < ApplicationRecord
  has_many :items
  has_secure_password
  validates :name, :email, :password, presence: true
  validates :password, length: {minimum: 8}
end
