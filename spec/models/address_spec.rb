require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validation tests' do
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:pincode) }
    it { should validate_presence_of(:full_address) }
  end

  describe 'associations' do

    # Note that polymorphic associations are automatically detected and do not
    # need any qualifiers:
    it { should belong_to(:addressable) }
  end
end
