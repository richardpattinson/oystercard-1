class Oystercard
  # MIN_FARE = 1
  # PENALTY_FARE = 6
  MAX_BALANCE = 90
  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize
    @balance = 0
    @entry_station
    @exit_station
    @journeys = []
  end

  def top_up(amount)
    fail 'max balance of #{max_balance} exceeded' if amount + @balance > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(entry_station)
    fail "insufficient balance" if balance < Journey::MIN_FARE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    pay_fare(Journey::MIN_FARE)
    @exit_station = exit_station
    @journeys << Journey.new(@entry_station, @exit_station)
    @entry_station = nil
  end

  private

  def pay_fare(amount)
    @balance -= amount
  end
end
