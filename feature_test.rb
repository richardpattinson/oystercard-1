require './lib/oystercard.rb'
# attr_reader :balance 

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

# @card.touch_in