class Device < ActiveRecord::Base

	belongs_to	:hypervisor, class_name: 'Device'
	belongs_to	:user
	has_many	 	:issues
	has_many 		:vms, class_name: 'Device',
										foreign_key: 'hypervisor_id'

	VIRTUAL					= %w[VM Physique]
	OS							= %w[Linux Windows]
	ENVIRONMENTS		= %w[Test Production]
	INFRASTRUCTURES	= %w[Citrix Vmware]
	SEARCH_FIELDS		= %w[name description ip service]

	class << self	
		def vms
			where(virtual: "Physique")
		end

		def by_infrastructure(infra)
			infra == '0' ? all : where(infrastructure: infra)
		end

		def by_user(user)
			user == '0' ? all : where(user_id: user)
		end

		def by_os(os)
			os == '0' ? all : where(os: os)
		end

		def by_virtual(virtual)
			virtual == '0' ? all: where(virtual: virtual)
		end
	end

end
