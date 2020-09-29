class AddTimeToRoutineUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :routine_users, :time, :time
  end
end
