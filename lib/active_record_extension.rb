module ActiveRecordExtension

  extend ActiveSupport::Concern

	def label
		"#{name} - #{description.truncate(25, :omission => "...")}"
	end

  module ClassMethods
		def search(q)
			if self::SEARCH_FIELDS
				conds = self::SEARCH_FIELDS.collect {|sf| "#{sf} LIKE '#{q}'"}.join(' OR ')		
				where(conds)
			else
				where('description LIKE ? OR name LIKE ?', q, q)
			end
		end

		def sort_column
			column = self.column_names.include? 'name' ? 'name asc' : 'last_name asc'
			column
		end
  end

end
ActiveRecord::Base.send(:include, ActiveRecordExtension)
