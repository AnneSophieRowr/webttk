class RenameDateFieldForActs < ActiveRecord::Migration
  def change
    rename_column :acts, :date, :report_date
  end
end
