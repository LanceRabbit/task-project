module Queries
  class Task < Queries::BaseQuery
    description 'get task by id'

    type Types::TaskType, null: false
    argument :id, Integer, required: false

    def resolve(id:)
      ::Task.find(id)
    end
  end
end