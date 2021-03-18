class User < ApplicationRecord
  has_secure_password
  has_many :properties, dependent: :delete_all
  has_many :addresses, as: :addressable, dependent: :delete_all
  has_one_attached :image, dependent: :destroy

  validates :email, uniqueness: true, presence: true
  validates :mobile, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true, length: { within: 6..40 }, on: :create
end
