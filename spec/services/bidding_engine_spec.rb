require 'rails_helper'

RSpec.describe BiddingEngine do
  let(:seller) { User.create(:email => 'abc@def.com', :password => 'pw1234') }
  let(:bidder) { User.create(:email => 'zxc@qwe.com', :password => 'pw1234') }
  let(:auction) { Auction.create(title: 'Anything', description: 'Lorem ipsum',
               start_date: DateTime.now, end_date: DateTime.now + 1.week,
               seller_id: seller.id) }

  describe 'bid!' do
    it "create new bid on an auction" do
      described_class.new(auction, 100, bidder).bid!
      expect(auction.errors).to be_empty

      described_class.new(auction, 90, bidder).bid!
      expect(auction.errors[:bid].first).to eq "must be bigger than the last bid on the auction"
    end

    it "can't create bid when it's equal to previous bid" do
      described_class.new(auction, 100, bidder).bid!
      expect(auction.errors).to be_empty

      described_class.new(auction, 100, bidder).bid!
      expect(auction.errors[:bid].first).to eq "must be bigger than the last bid on the auction"
    end

    it "can't create bid when it's equal to previous bid" do
      described_class.new(auction, -100, bidder).bid!
      expect(auction.errors[:bid].first).to eq 'plz enter valid bid amount'
    end
  end
end
