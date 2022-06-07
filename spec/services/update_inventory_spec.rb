require "rails_helper"

describe UpdateInventory, type: :service do
  describe "#call" do
    subject(:service_call)  { described_class.new(message).call }
    let(:store)     { "ALDO Auburn Mall" }
    let(:model)     { "ALALIWEN" }
    let(:inventory) { rand(1..100) }
    let(:message) { { store: store, model: model, inventory: inventory }.to_json }

    context "when the message is valid" do
      it "returns true" do
        expect(service_call).to be_truthy
      end

      it "creates the shoe record" do
        expect { service_call }.to change(Shoe, :count).by(1)
      end

      it "creates the store record" do
        expect { service_call }.to change(Store, :count).by(1)
      end

      it "creates the InventoryItem record" do
        expect { service_call }.to change(InventoryItem, :count).by(1)
      end
    end
  end
end
