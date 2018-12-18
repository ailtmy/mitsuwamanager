module ApplicationHelper
  def page_title
    title = "みつわ管理"
    title = @page_title + "-" + title if @page_title
    title
  end
end
