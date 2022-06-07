# frozen_string_literal: true

require "rails_helper"

describe InventoryItem, type: :model do
  describe "model validations" do
    subject(:store) { described_class.new }
    it { is_expected.to belong_to(:store) }
    it { is_expected.to belong_to(:shoe) }
  end
end
