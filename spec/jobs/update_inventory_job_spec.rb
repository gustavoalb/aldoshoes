# frozen_string_literal: true

require "rails_helper"

RSpec.describe UpdateInventoryJob, type: :job do
  let(:message) { { store: "ALDO Auburn Mall", model: "ALALIWEN", inventory: 99 }.to_json }

  it "calls the correct service" do
    expect(UpdateInventory).to receive(:new).with(message)

    described_class.new.perform(message)
  end
end
