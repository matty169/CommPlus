class AddTeachToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :teach, :boolean, null: false, default: false
  end
end
