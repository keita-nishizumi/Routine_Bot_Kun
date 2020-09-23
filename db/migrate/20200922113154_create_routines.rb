class CreateRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :routines do |t|
      t.string :name, null: false
      t.string :description
      t.date :start_date, null: false
      t.date :end_date
      t.time :time
      t.references :user, null: false
      t.timestamps
    end
  end
end
