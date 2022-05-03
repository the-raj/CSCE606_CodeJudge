class RemoveExtensionFromSubmissions < ActiveRecord::Migration[7.0]
  def change
    remove_column :submissions, :extension, :string
  end
end
