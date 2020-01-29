require './lib/oystercard.rb'
require './lib/station.rb'

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

p "let's go on a journey! touch in!"
@card.touch_in("here")
p "you touched in here"

@card.touch_out("there")
p "you touched out there"
print_balance

p @card.journeys