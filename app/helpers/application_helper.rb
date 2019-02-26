module ApplicationHelper
  def page_title
    title = "みつわマネージャー"
    title = @page_title + '-' + title if @page_title
    title
  end
end
