# frozen_string_literal: true

require "rails_helper"

RSpec.describe GraphqlController do
  let(:inventory_item1) { create(:inventory_item, available_stock: 12) }
  let(:inventory_item2) { create(:inventory_item, available_stock: 11) }

  describe "on POST to #execute" do
    before do
      inventory_item1
      inventory_item2
      post :execute, params: { query: query }
    end

    context "without filters" do
      let(:response_hash) do
        { data: { shoes: { nodes: [
          { model: inventory_item1.shoe.model, stockAlerts: [] },
          { model: inventory_item2.shoe.model, stockAlerts: [] }
        ] } } }.to_json
      end
      let(:query) do
        <<~GQL
          query getShoes {
            shoes {
              nodes {
                model
                stockAlerts {
                  store
                  availableStock
                }
              }
            }
          }
        GQL
      end

      it "responds with success" do
        expect(response).to have_http_status 200
      end

      it "returns the data correctly" do
        expect(response.body).to eq(response_hash)
      end
    end

    context "with filters" do
      let(:inventory_item2) { create(:inventory_item, available_stock: 9) }
      let(:response_hash) do
        { data: { shoes: { nodes: [
          { model: inventory_item2.shoe.model, stockAlerts: [{ store: inventory_item2.store.name, availableStock: inventory_item2.available_stock }] }
        ] } } }.to_json
      end
      let(:query) do
        <<~GQL
          query getShoes {
            shoes(model: "#{inventory_item2.shoe.model}") {
              nodes {
                model
                stockAlerts {
                  store
                  availableStock
                }
              }
            }
          }
        GQL
      end

      it "responds with success" do
        expect(response).to have_http_status 200
      end

      it "returns the data correctly" do
        expect(response.body).to eq(response_hash)
      end
    end
  end
end
