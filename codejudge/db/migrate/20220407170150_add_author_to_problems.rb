class AddAuthorToProblems < ActiveRecord::Migration[7.0]
  def change
    add_reference :problems, :users, index:true, foreign_key:true
  end
end
