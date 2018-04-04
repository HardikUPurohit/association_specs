require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(email: 'abc@def.com', password: 'password') }
  context "Validations" do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'invalid without password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'invalid without email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'invalid format for email' do
      subject.email = "abcdef"
      expect(subject).to_not be_valid
    end
  end
end
