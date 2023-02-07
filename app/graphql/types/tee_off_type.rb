# frozen_string_literal: true

module Types
  class TeeOffType < Types::BaseObject
    field :id, ID, null: false
    field :start_at, GraphQL::Types::ISO8601DateTime
    field :end_at, GraphQL::Types::ISO8601DateTime
    field :start_date, GraphQL::Types::ISO8601Date
    field :interval, Integer
    field :interval_flag, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
