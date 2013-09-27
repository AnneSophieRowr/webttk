class Issue < ActiveRecord::Base

	belongs_to :category
	belongs_to :status
	belongs_to :creator, :class_name => 'User', :foreign_key => 'created_by_id'
	belongs_to :notifier, :class_name  => 'User', :foreign_key => 'notified_by_id'

	validates_presence_of :status_id, :report_date, :description, :created_by_id, :notified_by_id, :equipment, :application

	DETECTIONS = %w[Reactif Proactif]
	APP_STATUSES = %w[OK Down]
	SEARCH_FIELDS = %w[report_date description equipment application]

	def label
		"#{description.truncate(25, :omission => "...")} - #{status.name}"
	end

	class << self
		def by_status(status)
			status == '0' ? all  : where(:status_id => status)
		end

		def by_category(category)
			category == '0' ? all  : where(:category_id => category)
		end

		def by_user(user)
			user == '0' ? all : where(:created_by_id => user)
		end
	end

end
