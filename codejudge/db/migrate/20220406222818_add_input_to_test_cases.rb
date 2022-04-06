class AddInputToTestCases < ActiveRecord::Migration[7.0]
  def change
    add_column :test_cases, :input, :string
  end
end
