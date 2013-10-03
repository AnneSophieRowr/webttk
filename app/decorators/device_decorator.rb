class DeviceDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

	def virtual_test
		if object.hypervisor.nil? && !object.vms.empty?
			[h.content_tag(:dt, I18n.t('devices.vms')),
			h.content_tag(:dd, object.vms.each {|vm| h.link_to vm.name, vm})].join(' ')
			#h.content_tag :dd
			#	objects.vms.each do |vm|
			#		link_to vm.name, vm
			#	end
			#end].join(' ')
		elsif !object.hypervisor.nil?
			h.content_tag(:dt, I18n.t('devices.hypervisor_id'))
			h.content_tag(:dd, object.hypervisor.name)
		end
	end

end
