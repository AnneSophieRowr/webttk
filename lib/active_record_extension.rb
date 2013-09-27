module ActiveRecordExtension

  extend ActiveSupport::Concern

	def label
		"#{name} - #{description}"
	end

  module ClassMethods
		def search(q)
			if self.column_names.include? 'name'
				where('description LIKE ? OR name LIKE ?', q, q)
			else
				where('description LIKE ?', q)
			end
		end

		def sort_column
			column = self.column_names.include? 'name' ? 'name asc' : 'last_name asc'
			column
		end
  end

end
ActiveRecord::Base.send(:include, ActiveRecordExtension)
