# frozen_string_literal: true

namespace :websocket do
  desc "TODO"
  task client: :environment do
    EM.run {
      ws = Faye::WebSocket::Client.new("ws://websocket_server:8080/")
      ws.on :message do |event|
        p JSON.parse(event.data)
        UpdateInventoryJob.perform_later(event.data)
      end
    }
  end
end
