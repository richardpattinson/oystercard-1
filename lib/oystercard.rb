class Oystercard
  MIN_FARE = 1
  MAX_BALANCE = 90
  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    @entry_station
  end

  def top_up(amount)
    fail 'max balance of #{max_balance} exceeded' if amount + @balance > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "insufficient balance" if balance < MIN_FARE
    @entry_station = station
  end

  def touch_out
    pay_fare(MIN_FARE)
    @entry_station = nil
  end

  private

  def pay_fare(amount)
    @balance -= amount
  end
end
