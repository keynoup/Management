class CreateUserApplicationDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :user_application_details do |t|
      
      t.integer       :user_application_id,   null: false
      t.integer       :equipment_id,          null: false
      t.string        :administrator
      t.text          :return_remarks

      t.timestamps
    end
  end
end
