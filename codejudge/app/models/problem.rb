class Problem < ApplicationRecord
  has_many :test_cases, dependent: :destroy
  accepts_nested_attributes_for :test_cases, reject_if: :all_blank, allow_destroy: true
end
