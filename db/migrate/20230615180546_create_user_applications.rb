class CreateUserApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :user_applications do |t|
      
    t.integer       :user_id,                  null: false
    t.string        :objective,                null: false
    t.string        :start_date,               null: false
    t.string        :return_date,              null: false
    t.string        :end_date,                 null: false
    t.string        :location,                 null: false
    t.string        :administrator
    t.text          :application_remarks
    t.integer       :application_status,       null: false, default: 0

      t.timestamps
    end
  end
end
