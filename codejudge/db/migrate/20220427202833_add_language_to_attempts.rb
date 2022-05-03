class AddLanguageToAttempts < ActiveRecord::Migration[7.0]
  def change
    add_reference :attempts, :language, index:true, foreign_key:true
  end
end
