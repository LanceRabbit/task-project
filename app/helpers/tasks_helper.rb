module TasksHelper
  def new_data?(task)
    task.id.nil? ? I18n.t('views.create') : I18n.t('views.update')
  end

  def sort_option(type)
    link_to t("views.tasks.#{type}"), tasks_path(sort: type)
  end

end
