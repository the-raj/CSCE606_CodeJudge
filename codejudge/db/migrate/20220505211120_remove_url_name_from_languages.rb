class RemoveUrlNameFromLanguages < ActiveRecord::Migration[7.0]
  def change
    remove_column :languages, :url_name, :string
  end
end
