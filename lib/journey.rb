class Journey
  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station, exit_station)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def complete?
    return false if @exit_station || @entry_station == nil
  end

  def fare
    self.complete? ? MIN_FARE : PENALTY_FARE
  end
end
