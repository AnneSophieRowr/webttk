class IssueDecorator < Draper::Decorator
  delegate_all

  def id
    "BPI_TCK_#{object.id}"
  end

  def title
    "BPI_TCK_#{object.id}_#{object.description}"
  end

  def actions_show
    actions = object.acts.order('created_at').collect.with_index do |action, idx|
      [h.content_tag(:dt, h.link_to("Action \##{idx + 1}", h.edit_issue_act_path(action.issue, action))), h.content_tag(:dd, action.description), h.content_tag(:dd, "#{action.report_date} - #{action.user.decorate.name}")].join(' ')
    end
    return actions.join(' ').html_safe
  end

end
