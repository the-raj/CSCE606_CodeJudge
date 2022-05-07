class DropAttemptsTestCasesTable < ActiveRecord::Migration[7.0]
  def up
      drop_table :attempts_test_cases
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
