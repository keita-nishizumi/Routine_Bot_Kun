class RemoveStartDateAndEndDateFromRoutines < ActiveRecord::Migration[6.0]
  def change
    remove_column :routines, :start_date, :date
    remove_column :routines, :end_date, :date
  end
end
