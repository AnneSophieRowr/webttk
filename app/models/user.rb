class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :issues

	def name
		"#{last_name} #{first_name}"
	end
end
