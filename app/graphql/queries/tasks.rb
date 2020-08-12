module Queries
  class Tasks < Queries::BaseQuery
    description 'list all tasks'

    type Types::TaskType.connection_type, null: false
    def resolve
      ::Task.all
    end
  end
end