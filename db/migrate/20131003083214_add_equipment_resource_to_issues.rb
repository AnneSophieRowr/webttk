class AddEquipmentResourceToIssues < ActiveRecord::Migration
  def change
		change_table :issues do |t|
			t.remove  :equipment
			t.integer :equipment_id,		:null => false
		end
  end
end
