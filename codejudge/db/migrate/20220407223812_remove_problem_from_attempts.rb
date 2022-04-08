class RemoveProblemFromAttempts < ActiveRecord::Migration[7.0]
  def change
    remove_column :attempts, :problem, :bigint
  end
end
