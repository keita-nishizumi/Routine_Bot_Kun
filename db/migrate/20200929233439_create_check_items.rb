class CreateCheckItems < ActiveRecord::Migration[6.0]
  def change
    create_table :check_items do |t|

      t.timestamps
    end
  end
end
