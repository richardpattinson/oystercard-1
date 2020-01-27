class Oystercard 
  
  attr_reader :balance 
  MAX_BALANCE = 90

  def initialize 
    @balance = 0
  end

  def top_up(amount)
    fail 'max balance of #{max_balance} exceeded' if amount + balance > MAX_BALANCE
    @balance += amount
  end

  def pay_fare(amount)
    @balance -= amount
  end
end