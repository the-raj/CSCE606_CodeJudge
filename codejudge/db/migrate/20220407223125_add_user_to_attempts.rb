class AddUserToAttempts < ActiveRecord::Migration[7.0]
  def change
    add_reference :attempts, :user, null: false, foreign_key: true
  end
end
