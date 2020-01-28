class Oystercard 
  MIN_FARE = 1
  MAX_BALANCE = 90
  attr_reader :balance, :journey
  
  def initialize 
    @balance = 0
    @journey = false
  end

  def top_up(amount)
    fail 'max balance of #{max_balance} exceeded' if amount + @balance > MAX_BALANCE
    @balance += amount
  end

  def pay_fare(amount)
    @balance -= amount
  end

  def in_journey?
    @journey
  end

  def touch_in
    fail 'insufficient balance' if balance < MIN_FARE
    @journey = true
  end

  def touch_out
    @journey = false
  end

end

