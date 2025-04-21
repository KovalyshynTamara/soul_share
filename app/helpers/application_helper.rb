module ApplicationHelper
  def flash_class(type)
    case type
    when "notice"
      "notice"
    when "alert"
      "alert"
    when "info"
      "info"
    when "warning"
      "warning"
    else
      ""
    end
  end
end
