class CreateEquipment < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment do |t|
      
      t.integer    :genre_id,          null: false
      t.string     :equipment_name,    null: false
      t.string     :management_number, null: false
      t.text       :equipment_remarks
      t.integer    :equipment_status,  null: false
      t.string     :administrator,     null: false

      t.timestamps
    end
  end
end
