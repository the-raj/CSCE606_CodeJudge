class CreateSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :submissions do |t|
      t.string :filename
      t.string :extension
      t.text :code

      t.timestamps
    end
  end
end
