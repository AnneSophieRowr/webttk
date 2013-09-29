class Statistic

	def self.stat1
		Issue.this_year.count(:group=>"MONTH(report_date)")
	end

end
