class ActDecorator < Draper::Decorator
  delegate_all

  def description
    object.description.capitalize
  end

end
