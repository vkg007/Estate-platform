class User < ApplicationRecord
  has_secure_password
  has_many :properties, dependent: :destroy
  has_many :addresses, as: :addressable, dependent: :destroy

  validates :email, uniqueness: true, presence: true
  validates :mobile, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true, length: { within: 6..40 }, on: :create
end
