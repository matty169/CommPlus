class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
    	t.string :user_event	
      	t.string :user_id
      	#t.string :skill_id

      t.timestamps
    end
  end
end
