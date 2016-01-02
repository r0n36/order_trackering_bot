module ApplicationHelper
  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def home?
    controller?('home') && action?('index')
  end

  def dashboard?
    controller?('dashboard') && action?('index')
  end
end
