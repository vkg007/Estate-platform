require 'rails_helper'

RSpec.describe Contract, type: :model do
  describe 'validation tests' do
    it { should validate_presence_of(:final_price) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:transaction_id) }
    it { should validate_uniqueness_of(:transaction_id) }
    it { should validate_presence_of(:payment_mode) }
    it { should validate_presence_of(:contract_type) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:property) }
  end
end
