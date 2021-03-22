class Property < ApplicationRecord
  belongs_to :user
  has_one :contract, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  validates :title, uniqueness: true, presence: true
  validates :title, :built_area, :carpet_area, :available_for, :floor_no,
            :type_of, :age, :bedrooms, :bathrooms, :parking_area, :description, presence: true

  scope :without_contract_user, lambda { |user_id|
    includes(:contract).references(:contract).where('property_id IS NULL')
                       .where.not('properties.user_id = ?', user_id)
  }
  scope :without_contract, -> { includes(:contract).references(:contract).where('property_id IS NULL') }
end
