class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name,  :null => false, :default => ""
      t.date :date, :null => false, :default => ""
      t.time :time, :null => false, :default => ""
      t.string :location,  :null => false, :default => ""
      t.string :description,  :null => false, :default => ""
      t.integer :host_id     # this is the person who created the event
      t.string :photo_url
      t.string :status

      t.timestamps
    end
  end
end
