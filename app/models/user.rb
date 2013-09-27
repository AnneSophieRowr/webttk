class User < ActiveRecord::Base
  devise :database_authenticatable, :trackable

	has_many :issues

	def name
		"#{last_name} #{first_name}"
	end
end
