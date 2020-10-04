class AddUserRoutineToRoutineUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :routine_users, :user, null: false, foreign_key: true
    add_reference :routine_users, :routine, null: false, foreign_key: true
  end
end
