require './lib/oystercard.rb'

def print_balance
    @balancenow = @card.balance
    p "your current balance is £#{@balancenow}"
  end

@card = Oystercard.new
p 'here is your card, enjoy'
print_balance

p "let's top up by £20"
@card.top_up(20)
print_balance

p "pay your fare now, £3 please"
@card.pay_fare(3)
print_balance

p "let's go on a journey! touch in!"
@card.touch_in
p "you touched in"
print_balance