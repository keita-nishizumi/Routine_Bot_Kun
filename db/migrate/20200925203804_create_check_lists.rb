class CreateCheckLists < ActiveRecord::Migration[6.0]
  def change
    create_table :check_lists do |t|
      t.string :text, null: false
      t.references :routine, null: false, foreign_key: true
      t.timestamps
    end
  end
end
