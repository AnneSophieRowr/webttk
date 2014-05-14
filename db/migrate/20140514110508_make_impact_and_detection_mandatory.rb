class MakeImpactAndDetectionMandatory < ActiveRecord::Migration
  def change
    change_column :issues, :impact, :string, null: false
    change_column :issues, :detection, :string, null: false
  end
end
