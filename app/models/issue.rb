class Issue < ActiveRecord::Base

	belongs_to :category
	belongs_to :status
	belongs_to :creator, :class_name => 'User', :foreign_key => 'created_by_id'
	belongs_to :notifier, :class_name  => 'User', :foreign_key => 'notified_by_id'

	validates_presence_of :status_id, :report_date, :description, :created_by_id, :notified_by_id, :equipment, :application

	DETECTIONS = %w[Reactif Proactif]
	APP_STATUSES = %w[OK Down]

	def label
		"#{description} - #{status.name}"
	end

end
