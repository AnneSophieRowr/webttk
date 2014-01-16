class UserDecorator < Draper::Decorator
  delegate_all

  def admin?
    object.admin ? I18n.t('helpers.words.yeslabel') : I18n.t('helpers.words.nolabel')
  end

  def name
    "#{object.first_name.capitalize} #{object.last_name.capitalize}"
  end

  def last_name
    object.last_name.capitalize
  end

  def first_name
    object.first_name.capitalize
  end


end
