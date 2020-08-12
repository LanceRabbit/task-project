# frozen_string_literal: true
module QueryObjects
  class HasMany
    def initialize(klass, field, ids)
      # @klass = klass.capitalize.constantize
      @klass = klass
      @field = field
      @ids = ids
    end

    def execute
      @klass
        .where(shared_membership)
    end

    private

    def shared_membership
      table[@field].in(@ids)
    end

    def table
      @klass.arel_table
    end
  end
end
