class AddProblemToAttempts < ActiveRecord::Migration[7.0]
  def change
    add_reference :attempts, :problem, null: false, foreign_key: true
  end
end
