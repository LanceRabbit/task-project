module Types
  module Bases
    module Interface
      include GraphQL::Schema::Interface

      field_class Types::Bases::Field
    end
  end
end
