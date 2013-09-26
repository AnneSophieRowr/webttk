class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
			t.datetime		:report_date,					:null => false
			t.string				:description,					:null => false
			t.string				:detailed_cause
			t.datetime		:start_time		
			t.datetime		:end_time
			t.datetime		:duration_1
			t.datetime		:duration_2
			t.datetime		:closure_date
			t.string			:reactivity,					:null => false,		:default => "Reactif"
			t.string			:app_status,					:null => false, 	:default => "Ok"
			t.string				:formal_description		
			t.string				:problem
			t.integer    	:status_id,           :null => false,		:default => 1
			t.integer			:category_id
			t.integer			:user_id,							:null => false

      t.timestamps
    end
  end
end
