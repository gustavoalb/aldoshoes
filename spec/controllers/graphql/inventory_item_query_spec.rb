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
        { data: { inventoryItems: { nodes:
            [{
              availableStock: inventory_item1.available_stock,
              store: {
                name: inventory_item1.store.name
              },
              shoe: {
                model: inventory_item1.shoe.model
              }
            },
             {
               availableStock: inventory_item2.available_stock,
               store: {
                 name: inventory_item2.store.name
               },
               shoe: {
                 model: inventory_item2.shoe.model
               }
             }] } } }.to_json
      end
      let(:query) do
        <<~GQL
          query getInventoryItems {
            inventoryItems {
              nodes {
                availableStock
                store {
                    name
                }
                shoe {
                    model
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
      let(:response_hash) do
        { data: { inventoryItems: { nodes:
            [{
              availableStock: inventory_item1.available_stock,
              store: {
                name: inventory_item1.store.name
              },
              shoe: {
                model: inventory_item1.shoe.model
              }
            }] } } }.to_json
      end
      let(:query) do
        <<~GQL
          query getInventoryItems {
            inventoryItems(storeName: "#{inventory_item1.store.name}") {
              nodes {
                availableStock
                store {
                    name
                }
                shoe {
                    model
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
