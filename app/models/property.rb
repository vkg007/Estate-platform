class Property < ApplicationRecord
  belongs_to :user
  has_one :address, as: :addressable
  
  validates :title, uniqueness: true, presence: true
end
