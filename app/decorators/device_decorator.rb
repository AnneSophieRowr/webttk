class DeviceDecorator < Draper::Decorator
  delegate_all

  def saved
    object.saved ? I18n.t('helpers.words.yeslabel') : I18n.t('helpers.words.nolabel')
  end

  def virtual_detailed
    content = []
    if object.hypervisor.nil? && !object.vms.empty?
      content << h.content_tag(:dt, I18n.t('device.vms'))
      object.vms.each do |vm|
        content << h.content_tag(:dd, h.link_to(vm.name, vm))
      end
    elsif !object.hypervisor.nil?
      content << [h.content_tag(:dt, I18n.t('device.hypervisor'))]
      content << h.content_tag(:dd, object.hypervisor.name)
    end
    content.join(' ').html_safe
  end

end
