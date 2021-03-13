class Property < ApplicationRecord
  belongs_to :user
  validates :title, uniqueness: true, presence: true
end
