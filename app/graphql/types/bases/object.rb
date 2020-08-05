module Types
  module Bases
    class Object < GraphQL::Schema::Object
      field_class Types::Bases::Field
    end
  end
end
