class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :role
  #This allows for a user to have multiple roles
end
