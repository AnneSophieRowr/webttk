class IssueDecorator < Draper::Decorator
  delegate_all

  def id
    "BPI_TCK_#{object.id}"
  end

  def title
    "BPI_TCK_#{object.id}_#{object.description.capitalize.truncate(70, omission: '...')}"
  end

  def status
    dt = h.content_tag(:dt, I18n.t('issue.status_id'))
    dd = h.content_tag(:dd, object.status.nil? ? '-' : object.status.name.capitalize)
    [dt, dd].join(' ').html_safe
  end

  def report_date
    dt = h.content_tag(:dt, I18n.t('issue.report_date'))
    dd = h.content_tag(:dd, object.report_date.nil? ? '-' : object.report_date)
    [dt, dd].join(' ').html_safe
  end

  def description
    dt = h.content_tag(:dt, I18n.t('issue.description'))
    dd = h.content_tag(:dd, object.description.nil? ? '-' : object.description.capitalize)
    [dt, dd].join(' ').html_safe
  end

  def creator
    dt = h.content_tag(:dt, I18n.t('issue.created_by_id'))
    dd = h.content_tag(:dd,  object.creator.nil? ? '-' : h.link_to(object.creator.name, object.creator))
    [dt, dd].join(' ').html_safe
  end

  def notifier
    dt = h.content_tag(:dt, I18n.t('issue.notified_by_id'))
    dd = h.content_tag(:dd, object.notifier.nil? ? '-' : h.link_to(object.notifier.name, object.notifier))
    [dt, dd].join(' ').html_safe
  end

  def follower
    dt = h.content_tag(:dt, I18n.t('issue.followed_by_id'))
    dd = h.content_tag(:dd,  object.follower.nil? ? '-' : h.link_to(object.follower.name, object.follower))
    [dt, dd].join(' ').html_safe
  end

  def device
    dt = h.content_tag(:dt, I18n.t('issue.device_id'))
    dd = h.content_tag(:dd, object.device.nil? ? '-' : h.link_to(object.device.name, object.device))
    [dt, dd].join(' ').html_safe
  end

  def application
    dt = h.content_tag(:dt, I18n.t('issue.application'))
    dd = h.content_tag(:dd, object.application.nil? ? '-' : object.application.capitalize)
    [dt, dd].join(' ').html_safe
  end

  def detection
    dt = h.content_tag(:dt, I18n.t('issue.detection'))
    dd = h.content_tag(:dd, object.detection.nil? ? '-' : object.detection.capitalize)
    [dt, dd].join(' ').html_safe
  end

  def impact
    dt = h.content_tag(:dt, I18n.t('issue.impact'))
    dd = h.content_tag(:dd, object.impact.nil? ? '-' : object.impact.capitalize)
    [dt, dd].join(' ').html_safe
  end

  def actions_show
    actions = object.acts.order('created_at').collect.with_index do |action, idx|
      [h.content_tag(:dt, h.link_to("Action \##{idx + 1}", h.edit_issue_act_path(action.issue, action))), h.content_tag(:dd, action.description), h.content_tag(:dd, "#{action.report_date} - #{action.user.decorate.name}")].join(' ')
    end
    return actions.join(' ').html_safe
  end

  def detailed_cause
    [h.content_tag(:dt, I18n.t('issue.detailed_cause')), h.content_tag(:dd, object.detailed_cause.empty? ? '-' : object.detailed_cause.capitalize)].join(' ').html_safe
  end

  def start_date
    dt = h.content_tag(:dt, I18n.t('issue.start_date'))
    dd = h.content_tag(:dd, object.start_date.nil? ? '-' : object.start_date)
    [dt, dd].join(' ').html_safe
  end

  def end_date
    dt = h.content_tag(:dt, I18n.t('issue.end_date'))
    dd = h.content_tag(:dd, object.end_date.nil? ? '-' : object.end_date)
    [dt, dd].join(' ').html_safe
  end

  def duration1
    div = h.content_tag :div, class: :small do
       I18n.t('issue.duration1_desc')
    end
    dt = h.content_tag :dt do
      [I18n.t('issue.duration1'), div].join(' ').html_safe
    end
    dd = h.content_tag(:dd, (object.start_date.nil? ? '-' : h.duration(object.start_date, object.end_date)))
    [dt, dd].join(' ').html_safe
  end

  def duration2
    div = h.content_tag :div, class: :small do
       I18n.t('issue.duration2_desc')
    end
    dt = h.content_tag :dt do
      [I18n.t('issue.duration2'), div].join(' ').html_safe
    end
    dd = h.content_tag(:dd, h.duration(object.report_date, object.closure_date))
    [dt, dd].join(' ').html_safe
  end

  def closure_date
    dt = h.content_tag(:dt, I18n.t('issue.closure_date'))
    dd = h.content_tag(:dd, object.closure_date.nil? ? '-' : object.closure_date)
    [dt, dd].join(' ').html_safe
  end

  def app_status
    dt = h.content_tag(:dt, I18n.t('issue.app_status'))
    dd = h.content_tag(:dd, object.app_status.empty? ? '-' : object.app_status.capitalize)
    [dt, dd].join(' ').html_safe
  end

  def category
    dt = h.content_tag(:dt, I18n.t('issue.category'))
    dd = h.content_tag(:dd, object.category.nil? ? '-' : object.category.name.capitalize)
    [dt, dd].join(' ').html_safe
  end

  def problem
    div = h.content_tag :div, class: :small do
       I18n.t('issue.problem_desc')
    end
    dt = h.content_tag :dt do
      [I18n.t('issue.problem'), div].join(' ').html_safe
    end
    dd = h.content_tag(:dd, object.problem.empty? ? '-' : object.problem.capitalize)
    [dt, dd].join(' ').html_safe
  end

end
