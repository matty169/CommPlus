class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :event_id
      t.string :user_id_string
      t.string :skill_id

      t.timestamps
    end
  end
end
