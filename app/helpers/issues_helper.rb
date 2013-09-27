module IssuesHelper

	def statuses
		[[t('helpers.words.all'), 0]] + Status.all.collect {|s| [s.name, s.id]}
	end

	def categories
		[[t('helpers.words.all'), 0]] + Category.all.collect {|s| [s.name, s.id]}
	end

end
