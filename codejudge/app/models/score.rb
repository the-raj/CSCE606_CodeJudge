class Score < ApplicationRecord
  belongs_to :attempt
  belongs_to :test_case
end
