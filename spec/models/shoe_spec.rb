# frozen_string_literal: true

require "rails_helper"

describe Shoe, type: :model do
  describe "model validations" do
    subject(:shoe) { described_class.new(model: "Shoe model") }
    it { is_expected.to validate_uniqueness_of(:model).case_insensitive }
    it { is_expected.to have_many(:inventory_items).dependent(:destroy) }
    it { is_expected.to have_many(:stores).through(:inventory_items) }
  end
end
