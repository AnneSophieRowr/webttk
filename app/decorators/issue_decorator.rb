class IssueDecorator < Draper::Decorator
  delegate_all

  def actions_show
    actions = object.acts.collect.with_index do |action, idx|
      [h.content_tag(:dt, h.link_to("Action \##{idx + 1}", h.edit_issue_act_path(action.issue, action))), h.content_tag(:dd, action.description), h.content_tag(:dd, "#{action.date} - #{action.user.decorate.name}")].join(' ')
    end
    return actions.join(' ').html_safe
  end

end
