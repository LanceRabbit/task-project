module TasksHelper
  def new_data?(task)
    task.id.nil? ? I18n.t('views.create') : I18n.t('views.update')
  end

  def sort_option(type)
    link_to t("views.tasks.#{type}"), tasks_path(sort: type)
  end

  def state_control(task)
    ctrl_str = ''
    if task.todo?
      ctrl_str += ' ' + link_to(I18n.t('views.tasks.state.execute'), execute_task_path, method: :post) + ' '
    end

    unless task.completed?
      ctrl_str += ' ' + link_to(I18n.t('views.tasks.state.finish'), finish_task_path, method: :post) + ' '
    end
    ctrl_str.html_safe
  end

  def state_options
    Task.states.map do |state|
      [I18n.t("views.tasks.state.#{state[0]}"), state[1], { class: state[1] }]
    end
  end

  def priority_options
    Task.priorities.keys.map do |priority|
      [priority, I18n.t("views.tasks.priority.#{priority}")]
    end
  end

  def tag_options
    Tag.all.map do |tag|
      [tag.name, tag.id]
    end
  end

  def list_tags(tags)
    tags.map do |tag|
      "<span class='badge badge-light'>#{tag}</span>"
    end.join(' ').html_safe
  end
end
