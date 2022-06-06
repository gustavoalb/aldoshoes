# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :ping, String, null: false, description: "Always returns pong."

    def ping
      "pong"
    end
  end
end
