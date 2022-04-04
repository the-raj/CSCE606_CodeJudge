class CreateTestCases < ActiveRecord::Migration[7.0]
  def change
    create_table :test_cases do |t|
      t.belongs_to :problem, foreign_key: true
      t.boolean:example, default:false, null:false
      t.timestamps
    end
  end
end
