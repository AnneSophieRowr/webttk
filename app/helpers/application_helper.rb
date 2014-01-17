module ApplicationHelper

  def duration(from, to)
    to = to.nil? ? Time.now : to
    distance_of_time_in_words(from, to).gsub('Il y a', '')
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "sortable current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "desc" ? "asc" : "desc"
    #link_to title, {:sort => column, :direction => direction}, {:class => css_class}
    link_to title, '#', {:class => css_class, :sort => column, :direction => direction}
  end

end
