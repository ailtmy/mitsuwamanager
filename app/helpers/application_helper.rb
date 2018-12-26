module ApplicationHelper
  def page_title
    title = "みつわマネージャー"
    title = @page_title + "-" + title if @page_title
    title
  end

  def show_model_path(model_type, model)
    if model_type == 'Person'
      person_path(model)
    elsif  model_type == 'Company'
      company_path(model)
    end
  end

  def edit_model_path(model_type, model)
    if model_type == 'Person'
      edit_person_path(model)
    elsif  model_type == 'Company'
      edit_company_path(model)
    end
  end
end
