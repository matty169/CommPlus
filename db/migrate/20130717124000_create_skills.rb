class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.boolean :teach
      t.string :name
      t.string :description
      t.integer :numb_events
      t.integer :user_id

      t.timestamps
    end
  end
end
