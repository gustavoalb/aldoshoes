# frozen_string_literal: true

require "rails_helper"

describe Store, type: :model do
  describe "model validations" do
    subject(:store) { described_class.new(name: "Store name") }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    it { is_expected.to have_many(:inventory_items) }
    it { is_expected.to have_many(:shoes).through(:inventory_items) }
  end
end
