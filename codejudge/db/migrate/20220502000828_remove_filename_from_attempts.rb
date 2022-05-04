class RemoveFilenameFromAttempts < ActiveRecord::Migration[7.0]
  def change
    remove_column :attempts, :filename
  end
end
