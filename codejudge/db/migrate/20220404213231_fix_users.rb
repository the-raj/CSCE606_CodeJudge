class FixUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :user, :username, :string
    add_column :user, :password, :string
    add_column :user, :firstname, :string
    add_column :user, :lastname, :string
  end
end
