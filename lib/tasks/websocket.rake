# frozen_string_literal: true

namespace :websocket do
  desc "TODO"
  task client: :environment do
    EM.run {
      ws = Faye::WebSocket::Client.new("ws://localhost:8080/")
      ws.on :message do |event|
        UpdateInventoryJob.perform_later(event.data)
      end
      ws.on :close do |event|
        # connection has been closed callback.
        p [:close, event.code, event.reason]

        # restart the connection
        start_connection
      end
    }
  end
end
