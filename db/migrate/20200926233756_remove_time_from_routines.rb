class RemoveTimeFromRoutines < ActiveRecord::Migration[6.0]
  def change
    remove_column :routines, :time, :time
  end
end
