class RemoveUserFromAttempts < ActiveRecord::Migration[7.0]
  def change
    remove_column :attempts, :user, :bigint
  end
end
