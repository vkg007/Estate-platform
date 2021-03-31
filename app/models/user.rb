class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :properties, dependent: :destroy
  has_many :addresses, as: :addressable, dependent: :destroy
  has_one_attached :image
  has_many :contracts, dependent: :destroy

  validates :email, uniqueness: true, presence: true
  validates :mobile, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true, length: { within: 6..40 }, on: :create
end
