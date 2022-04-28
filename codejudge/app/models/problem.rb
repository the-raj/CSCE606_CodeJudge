class Problem < ApplicationRecord
  has_many :test_cases
  accepts_nested_attributes_for :test_cases 
end
