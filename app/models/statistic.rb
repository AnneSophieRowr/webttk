class Statistic

  def self.by_month
    Issue.this_year.count(:group=>"MONTHNAME(report_date)")
  end

end
