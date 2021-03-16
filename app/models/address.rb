class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :city, presence: true
  validates :pincode, presence: true
  validates :full_address, presence: true
end
