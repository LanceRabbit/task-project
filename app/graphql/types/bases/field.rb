module Types
  module Bases
    class Field < GraphQL::Schema::Field
      argument_class Types::Bases::Argument
    end
  end
end
