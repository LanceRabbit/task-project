# frozen_string_literal: true
module Types
  class TaskType < Types::Bases::Object
    field :id, ID, null: false
    field :title, String, null: false
    field :content, String, null: true
    field :state, Integer, null: false
    field :priority, Integer, null: false
    field :start_date, GraphQL::Types::ISO8601Date, null: false
    field :end_date, GraphQL::Types::ISO8601Date, null: false
  end
end
