module ApplicationHelper
  def full_page_title(partial_title)
    base_title = "Ruby on Rails Tutorial Sample App"
    return "#{base_title} | #{partial_title}" unless partial_title.blank?
    return base_title
  end
end
