require "journey"

# let(:subject) { described.class.new }

describe Journey do
  it "knows if a journey is not complete" do
    trip = Journey.new(nil, "Station")
    expect(trip).not_to be_complete
  end

  it "has a penalty fare if entry or exit station not registered" do
    trip = Journey.new(nil, "Station")
    expect(trip.fare).to eq Journey::PENALTY_FARE
  end
end
