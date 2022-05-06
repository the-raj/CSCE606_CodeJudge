class AddPassedToAttemptsTestCases < ActiveRecord::Migration[7.0]
  def change
    add_column :attempts_test_cases, :passed, :boolean
  end
end
