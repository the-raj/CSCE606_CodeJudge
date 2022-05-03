class AddFilenameToAttempts < ActiveRecord::Migration[7.0]
  def change
    add_column :attempts, :filename, :string
  end
end
