class Category < ActiveRecord::Base

	has_many :issues

	validates_presence_of :name

end
