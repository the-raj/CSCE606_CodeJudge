class AddGoogleIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :google_id, :string
  end
end
