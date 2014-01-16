module DevicesHelper

	def infrastructures
		[[t('helpers.words.all'), 0]] + Device::INFRASTRUCTURES.collect {|infra| [infra, infra]}
	end

	def virtual
		[[t('helpers.words.all'), 0]] + Device::VIRTUAL.collect {|virtual| [virtual, virtual]}
	end

	def os
		[[t('helpers.words.all'), 0]] + Device::OS.collect {|os| [os, os]}
	end

	def users
		[[t('helpers.words.all'), 0]] + User.all.collect {|s| [s.name, s.id]}
	end

end
