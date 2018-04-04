require 'rails_helper'

RSpec.describe Bid, type: :model do
  subject { described_class.new(bidder_id: 1, auction_id: 1, amount: 10) }

  context "Validations" do
    it "invalid without bidder_id" do
      subject.bidder_id = nil
      expect(subject).to_not be_valid
    end

    it "invalid without auction_id" do
      subject.auction_id = nil
      expect(subject).to_not be_valid
    end

    it "invalid without amount" do
      subject.amount = nil
      expect(subject).to_not be_valid
    end
  end

  context "Associations" do
    it "belongs_to bidder" do
      assc = described_class.reflect_on_association(:bidder)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs_to auction" do
      assc = described_class.reflect_on_association(:auction)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
