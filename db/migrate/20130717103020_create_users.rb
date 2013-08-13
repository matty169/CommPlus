class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,  :null => false, :default => ""
      t.string :description, :null => false, :default => ""
      t.integer :rating, default: 0
      t.boolean :is_male, default: true
      t.string :location,  :null => false, :default => ""
      t.timestamps
    end
  end
end
