class AddPrettyNameToLanguages < ActiveRecord::Migration[7.0]
  def change
    add_column :languages, :pretty_name, :string
  end
end
