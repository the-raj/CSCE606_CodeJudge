class TestCase < ApplicationRecord
  belongs_to :problem
  validates :output, presence: true
  has_and_belongs_to_many :attempts
end
