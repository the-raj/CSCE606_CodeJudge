class Attempt < ApplicationRecord
  belongs_to :language
  belongs_to :user
  belongs_to :problem
  has_and_belongs_to_many :test_cases
end
