class TestCase < ApplicationRecord
  belongs_to :problem
  validates :output, presence: true
  has_many :test_cases, :through => :scores
end
