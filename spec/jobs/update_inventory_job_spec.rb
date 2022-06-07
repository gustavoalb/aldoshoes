# frozen_string_literal: true

require "rails_helper"

RSpec.describe UpdateInventoryJob, type: :job do
  let(:message) { { store: "ALDO Auburn Mall", model: "ALALIWEN", inventory: 99 }.to_json }

  it "performed the job" do
    expect { UpdateInventoryJob.perform_later(message) }.to have_performed_job(UpdateInventoryJob)
  end
end
