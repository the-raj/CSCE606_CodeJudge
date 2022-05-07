class AddStdoutToAttemptsTestCases < ActiveRecord::Migration[7.0]
  def change
    add_column :attempts_test_cases, :stdout, :text
    add_column :attempts_test_cases, :stderr, :text
    remove_column :attempts_test_cases, :output
  end
end
