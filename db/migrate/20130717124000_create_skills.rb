class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.boolean :teach, default: false
      t.string :name,  :null => false, :default => ""
      t.string :description,  :null => false, :default => ""
      t.integer :numb_events, default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end
