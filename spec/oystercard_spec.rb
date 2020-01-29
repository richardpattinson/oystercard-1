require "oystercard"
require "spec_helper"

describe Oystercard do
  it "has a balance of zero" do
    expect(subject.balance).to eq(0)
  end

  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "can top up the balance" do
      expect { subject.top_up 1 }.to change { subject.balance }.by 1
    end

    it "raises an error if new balance would exceed max limit" do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect { subject.top_up 1 }.to raise_error 'max balance of #{max_balance} exceeded'
    end
  end

  describe "#travelling" do
    it "is initially not in a journey" do
      expect(subject).not_to be_in_journey
    end

    it "can touch in" do
      subject.top_up(20)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it "can touch out" do
      subject.top_up(20)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it "will not touch in if balance is lower than min fare" do
      expect { subject.touch_in }.to raise_error "insufficient balance"
    end

    it "deducts minimum fare on touch out" do
      subject.top_up(20)
      # subject.touch_in
      expect { subject.touch_out }.to change { subject.balance }.by -Oystercard::MIN_FARE
    end
  end
end
