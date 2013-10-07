class UserDecorator < Draper::Decorator
  delegate_all

	def admin?
		object.admin ? I18n.t('helpers.words.yeslabel') : I18n.t('helpers.words.nolabel')
	end

end
