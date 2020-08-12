require 'graphql/batch'
module Loaders
  class HasMany < ::GraphQL::Batch::Loader
    def initialize(model)
      @model = model
    end

    def perform(ids)
      ref_field = @model[:ref_field]
      resource = ::QueryObjects::HasMany.new(@model[:ref_class], ref_field, ids).execute
      group = resource.group_by { |object| object.send(@model[:ref_field]) }
      ids.each { |id| fulfill(id, group[id]) }
    end
  end
end