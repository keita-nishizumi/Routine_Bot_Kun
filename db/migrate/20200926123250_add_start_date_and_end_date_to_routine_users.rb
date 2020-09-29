class AddStartDateAndEndDateToRoutineUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :routine_users, :start_date, :date
    add_column :routine_users, :end_date, :date
  end
end
