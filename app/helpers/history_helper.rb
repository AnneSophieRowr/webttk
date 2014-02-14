module HistoryHelper

  # Get username from user id 
  def who(whodunnit)
    u = User.find(whodunnit)
    u = u.nil? ? 'unknown' : u.decorate.name
  end

  # Three first common cells for each row, regardless event type 
  def common_cells(version)
    content_tag(:td, I18n.t("history.#{version.event}")) + content_tag(:td, who(version.whodunnit)) + content_tag(:td, version.created_at)
  end

  # Cells for update event
  def update_cells(k, v)
    # Special treatment if attribute is a belongs_to association
    belongs = Hash.new
    Device.reflections.each {|k,v| belongs[v.foreign_key.to_s] = k unless v.macro != :belongs_to}
    if belongs.keys.include? k
      model = Device.reflect_on_association(belongs[k]).class_name.constantize
      before = v.first.nil? ? '-' : (model.find_by_id(v.first).nil? ? I18n.t('history.unknown') : model.find(v.first).decorate.name)
      after = v.last.nil? ? '-' : (model.find_by_id(v.last).nil? ? I18n.t('history.unknown') : model.find(v.last).decorate.name)
      cells = content_tag(:td, before) + content_tag(:td, after)
    else
      cells = content_tag(:td, v.first) + content_tag(:td, v.last)
    end
    return cells
  end

  # Global method for each history row
  def history_row(version)
    lines = ''
    # If create  event, column/before/after are necessarily empty
    if version.event == 'create'
      lines = content_tag :tr, class: 'success' do
        common_cells(version) +
        content_tag(:td, '-') +
        content_tag(:td, '-') +
        content_tag(:td, '-') 
      end
    # If update event and attribute changed is active => item as been logically destroyed or re-activated
    elsif version.event == 'update' and version.changeset.keys.include? 'active'
      version.event = 'destroy'
      klass = 'danger'
      if version.changeset['active'].last == true
        version.event = 'wake'
        klass = 'success'
      end
      lines = content_tag :tr, class: klass do
        common_cells(version) +
        content_tag(:td, '-') +
        content_tag(:td, '-') +
        content_tag(:td, '-') 
      end
    else
      version.changeset.each do |k, v|
        lines += content_tag :tr do
          common_cells(version) +
          content_tag(:td, I18n.t("device.#{k}")) +
          update_cells(k, v)
        end
      end
    end

    return lines.html_safe

  end

end

