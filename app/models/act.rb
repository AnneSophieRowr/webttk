class Act < ActiveRecord::Base

  belongs_to :issue
  belongs_to :user

  validates_presence_of :description, :user_id, :issue_id
  
  default_scope order('date desc')

end
