class ChangeForeignKeyForProblems < ActiveRecord::Migration[7.0]
  def change
    rename_column :problems, :users_id, :author_id
  end
end
