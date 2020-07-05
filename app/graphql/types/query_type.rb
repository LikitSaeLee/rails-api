# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :current_user, UserType, null: true do
      description 'Find the current user'
    end

    def current_user
      context[:current_user]
    end
  end
end
