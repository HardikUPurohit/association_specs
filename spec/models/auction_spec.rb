require 'rails_helper'

RSpec.describe Auction, type: :model do
  subject { described_class.new(title: 'my title', start_date: DateTime.now,
                                end_date: DateTime.now + 1.day,
                                description: 'abcdefghijklmnopq',
                                seller_id: 1, buyer_id: 1) }
  context "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without start_date" do
      subject.start_date = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without end_date" do
      subject.end_date = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without description" do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without seller_id' do
      subject.seller_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid when description is too short" do
      subject.description = "abcdefg"
      expect(subject).to_not be_valid
    end

    it "is not valid when start_date is greater than end_date" do
      subject.start_date = DateTime.now + 1
      subject.end_date = DateTime.now
      expect(subject.save).to eq(false)
    end

    it "is not valid when start_date is less than current date" do
      subject.start_date = DateTime.now - 1
      expect(subject).to_not be_valid
    end
  end
  
  context "Associations" do
    it "has one buyer" do
      assc = described_class.reflect_on_association(:buyer)
      expect(assc.macro).to eq :has_one
    end

    it "has one seller" do
      assc = described_class.reflect_on_association(:seller)
      expect(assc.macro).to eq :has_one
    end

    it "has many bids" do
      assc = described_class.reflect_on_association(:bids)
      expect(assc.macro).to eq :has_many
    end
  end
end
