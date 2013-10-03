class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
			t.string		:name
			t.text			:description
			t.string		:ip
			t.boolean		:saved # sauvegardé ou pas
			t.string		:os # linux ou windows
			t.string		:infrastructure # vmware ou citrix
			t.integer		:user_id  # responsable
			t.string		:environment # prod ou test
			t.string		:virtual # physique ou virtuel
			t.integer		:hypervisor_id # id hyperviseur si virtuel
			t.string		:service # webmag, sbur ...


      t.timestamps
    end
  end
end
