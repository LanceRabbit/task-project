module TasksHelper
  def new_data?(task)
    task.id.nil? ? I18n.t('views.create') : I18n.t('views.update')
  end
end
