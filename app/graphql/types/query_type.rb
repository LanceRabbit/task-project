module Types
  class QueryType < Types::Bases::Object
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :tasks, resolver: Queries::Tasks
    field :users, resolver: Queries::Users
    field :task, resolver: Queries::Task
    field :user, resolver: Queries::User
    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end
  end
end
