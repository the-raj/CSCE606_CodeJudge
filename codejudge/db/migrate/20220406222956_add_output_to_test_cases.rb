class AddOutputToTestCases < ActiveRecord::Migration[7.0]
  def change
    add_column :test_cases, :output, :string
  end
end
