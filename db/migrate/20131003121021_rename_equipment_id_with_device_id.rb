class RenameEquipmentIdWithDeviceId < ActiveRecord::Migration
  def change
		rename_column :issues, :equipment_id, :device_id
  end
end
