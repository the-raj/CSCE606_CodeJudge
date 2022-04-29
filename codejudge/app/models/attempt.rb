class Attempt < ApplicationRecord
  has_one :language
  has_one :user
  has_one :problem
end
