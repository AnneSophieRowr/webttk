class IssueDecorator < Draper::Decorator
  delegate_all

  def actions_show
    actions = object.acts.collect.with_index do |action, idx|
      [h.content_tag(:dt, "Action \##{idx + 1}"), h.content_tag(:dd, action.description), h.content_tag(:dd, action.date), h.content_tag(:dd, action.user.decorate.name)].join(' ')
    end
    return actions.join(' ').html_safe
  end

end
