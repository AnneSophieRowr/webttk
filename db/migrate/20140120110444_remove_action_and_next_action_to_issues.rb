class RemoveActionAndNextActionToIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :action
    remove_column :issues, :next_action
  end
end
