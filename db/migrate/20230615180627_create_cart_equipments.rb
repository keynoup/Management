class CreateCartEquipments < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_equipments do |t|
      
      t.integer :user_id,      null: false
      t.integer :equipment_id, null: false
      
      t.timestamps
    end
  end
end
