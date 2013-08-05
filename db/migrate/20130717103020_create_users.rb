class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :description
      t.integer :rating
      t.boolean :is_male
      t.string :location
      t.timestamps
    end
  end
end
