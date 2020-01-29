require "station"

describe Station do
  subject { described_class.new("Old Street", 1) }

  it "knows station name" do
    expect(subject.name).to eq("Old Street")
  end

  it "knows it's zone" do
    expect(subject.zone).to eq(1)
  end
end
