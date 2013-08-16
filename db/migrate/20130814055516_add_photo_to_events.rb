class AddPhotoToEvents < ActiveRecord::Migration
  def change
  	# This makes room for carrierwave. Adding photo functionality to events.
    add_column :events, :photo, :string, null: false, default: ""
  end
end
