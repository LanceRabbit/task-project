module TasksHelper
  def new_data?(task)
    task.id.nil? ? "Create" : "Update"
  end
end
