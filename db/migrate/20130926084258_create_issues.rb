class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      # Required
      t.integer   :status_id,       :null => false, :default => 1
      t.datetime  :report_date,     :null => false
      t.text      :description,     :null => false
      t.integer   :created_by_id,   :null => false
      t.integer   :notified_by_id,  :null => false				
      t.string    :equipment,       :null => false
      t.string    :application,     :null => false

      # Required for issue treatment
      t.text      :action
      t.text      :next_action
      t.text      :detailed_cause
      t.datetime  :start_time		
      t.datetime  :end_time

      # Completed by issue manager 
      t.datetime  :closure_date
      t.string    :detection
      t.string    :app_status
      t.integer   :category_id
      t.text      :problem

      t.timestamps
    end
  end
end
