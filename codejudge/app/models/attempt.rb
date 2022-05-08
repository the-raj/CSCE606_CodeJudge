class Attempt < ApplicationRecord
  belongs_to :language
  belongs_to :user
  belongs_to :problem
  has_many :scores, dependent: :destroy
  has_many :test_cases, :through => :scores 
end
