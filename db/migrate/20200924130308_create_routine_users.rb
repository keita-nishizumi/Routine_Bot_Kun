class CreateRoutineUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :routine_users do |t|

      t.timestamps
    end
  end
end
