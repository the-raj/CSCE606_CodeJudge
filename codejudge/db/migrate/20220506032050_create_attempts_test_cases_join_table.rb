class CreateAttemptsTestCasesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :attempts_test_cases, id: false do |t|
      t.bigint :attempt_id
      t.bigint :test_case_id
    end

    add_index :attempts_test_cases, :attempt_id
    add_index :attempts_test_cases, :test_case_id

  end
end
