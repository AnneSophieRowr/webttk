class AddFollowerIdToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :followed_by_id, :integer
  end
end
