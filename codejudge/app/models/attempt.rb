class Attempt < ApplicationRecord
  belongs_to :language
  belongs_to :user
  belongs_to :problem

end
