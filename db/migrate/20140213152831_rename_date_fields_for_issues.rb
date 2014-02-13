class RenameDateFieldsForIssues < ActiveRecord::Migration
  def change
    rename_column :issues,  :start_time,  :start_date
    rename_column :issues,  :end_time,    :end_date
  end
end
