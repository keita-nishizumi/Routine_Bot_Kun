class CreateCheckItems < ActiveRecord::Migration[6.0]
  def change
    create_table :check_items do |t|
      t.string :text, null: false
      t.references :check_list, null:false, foreign_key: true
      t.timestamps
    end
  end
end
