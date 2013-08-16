class AddLeveltoSkills < ActiveRecord::Migration
  def change
  	add_column :skills, :level, :integer, null: false, default: 0
  end
end
