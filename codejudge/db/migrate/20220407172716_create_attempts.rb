class CreateAttempts < ActiveRecord::Migration[7.0]
  def change
    create_table :attempts do |t|
      t.bigint :user
      t.bigint :problem

      t.timestamps
    end
  end
end
