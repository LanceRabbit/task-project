module Types
  module Bases
    class InputObject < GraphQL::Schema::InputObject
      argument_class Types::Bases::Argument
    end
  end
end
