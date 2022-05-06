class AddOutputToAttemptsTestcases < ActiveRecord::Migration[7.0]
  def change
    add_column :attempts_test_cases, :output, :text
  end
end
