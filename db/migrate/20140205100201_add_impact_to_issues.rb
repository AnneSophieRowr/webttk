class AddImpactToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :impact, :string
  end
end
