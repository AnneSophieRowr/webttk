class Issue < ActiveRecord::Base

	belongs_to :category
	belongs_to :status
	belongs_to :user

	validates_presence_of :report_date, :description, :app_status, :status_id, :user_id

	REACTIVITIES = %w[Reactif Proactif]
	APP_STATUSES = %w[OK Down]

	def label
		"#{description} - #{status.name}"
	end

end
