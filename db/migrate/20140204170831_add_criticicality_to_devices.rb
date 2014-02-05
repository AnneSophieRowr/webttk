class AddCriticicalityToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :criticality, :string
  end
end
