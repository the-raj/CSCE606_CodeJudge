class TestCase < ApplicationRecord
  belongs_to :problem
  validates :output, presence: true
end
