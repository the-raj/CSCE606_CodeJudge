class DropSubmissions < ActiveRecord::Migration[7.0]
  def change
    drop table :submissions
  end
