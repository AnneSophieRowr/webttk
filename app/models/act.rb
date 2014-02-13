class Act < ActiveRecord::Base

  belongs_to :issue
  belongs_to :user

  validates_presence_of :description, :user_id, :issue_id, :report_date
  
  default_scope order('report_date desc')

end
