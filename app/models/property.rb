class Property < ApplicationRecord
  belongs_to :user
  has_one :contract
  has_one :address, as: :addressable, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  validates :title, uniqueness: true, presence: true
end
