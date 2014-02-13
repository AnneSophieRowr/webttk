class ChangeReportDateActType < ActiveRecord::Migration
  def change
    change_column :acts, :report_date, :datetime
  end
end
