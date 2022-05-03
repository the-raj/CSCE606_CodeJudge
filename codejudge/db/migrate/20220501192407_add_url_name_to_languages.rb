class AddUrlNameToLanguages < ActiveRecord::Migration[7.0]
  def change
    add_column :languages, :url_name, :string
  end
end
