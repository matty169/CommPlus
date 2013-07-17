class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.string :location
      t.string :description
      t.integer :attendee_id

      t.timestamps
    end
  end
end
