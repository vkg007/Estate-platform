class Contract < ApplicationRecord
  belongs_to :user
  belongs_to :property
  validates :final_price, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :transaction_id, uniqueness: true, presence: true
  validates :payment_mode, presence: true
  validates :contract_type, presence: true

  scope :single_contract_detail, ->(contract_id) { includes(:property, :user).where('contracts.id = ?', contract_id).first }
end
