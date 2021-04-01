require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'validation tests' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:built_area) }
    it { should validate_presence_of(:carpet_area) }
    it { should validate_presence_of(:available_for) }
    it { should validate_presence_of(:floor_no) }
    it { should validate_presence_of(:type_of) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:bedrooms) }
    it { should validate_presence_of(:bathrooms) }
    it { should validate_presence_of(:parking_area) }
    it { should validate_presence_of(:description) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_one(:address).dependent(:destroy) }
    it { should have_one(:contract).dependent(:destroy) }
    it { should have_many_attached(:images) }
  end
end
