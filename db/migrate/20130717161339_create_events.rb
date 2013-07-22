class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.string :location
      t.string :description
      #t.integer :host     # this is the person who created the event
      t.string :photo_url

      t.timestamps
    end
  end
end
