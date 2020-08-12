# frozen_string_literal: true
module Types
  class UserType < Types::Bases::Object
    field :id, ID, null: false
    field :email, String, null: false
    field :tasks_count, Integer, null: true
    field :name, String, null: false
    field :full_name, String, null: false
    field :tasks, [Types::TaskType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false

    def full_name
      "#{object.id} - #{object.name}"
    end

    def tasks
      # HasManyLoader.for(ref_class: CompanyLinkRepository, ref_id: 'company_id').load(object.id)
      # Loaders::HasMany.for(Task).load(object.id)
      Loaders::HasMany.for(ref_class: Task, ref_field: 'user_id').load(object.id)
    end
  end
end