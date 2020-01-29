require "oystercard"
require "spec_helper"

describe Oystercard do
  let(:station) { double :station }
  card = Oystercard.new
  card.top_up(20)

  it "has a balance of zero" do
    expect(subject.balance).to eq(0)
  end

  it "is initially not in a journey" do
    expect(card).not_to be_in_journey
  end

  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "can top up the balance" do
      expect { card.top_up 1 }.to change { card.balance }.by 1
    end

    it "raises an error if new balance would exceed max limit" do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect { subject.top_up 1 }.to raise_error 'max balance of #{max_balance} exceeded'
    end
  end

  context "when travelling" do
    describe "#touch_in" do
      it "accepts an entry station argument" do
        expect { card.touch_in(station) }.to change { card.entry_station }.to(station)
      end

      it "can touch in" do
        card.touch_in(station)
        expect(card).to be_in_journey
      end

      it "will not touch in if balance is lower than min fare" do
        expect { subject.touch_in(station) }.to raise_error "insufficient balance"
      end
    end

    describe "#touch_out" do
      it "can touch out" do
        card.touch_in(station)
        card.touch_out
        expect(card).not_to be_in_journey
      end

      it "deducts minimum fare on touch out" do
        expect { card.touch_out }.to change { card.balance }.by -Oystercard::MIN_FARE
      end
    end
  end
end
