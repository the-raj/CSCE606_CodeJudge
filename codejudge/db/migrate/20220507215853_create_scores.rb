class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.boolean :passed
      t.text :stdout
      t.text :stderr
      t.references :attempt, index: true, foreign_key: true
      t.references :test_case, index: true, foreign_key: true
      t.timestamps
    end
  end
end
