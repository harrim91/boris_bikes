require_relative "bike"
class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "Docking Station is empty" if empty?
    @bikes.first
  end

  def dock(bike)
    raise "Docking station is full" if full?
    @bikes << bike
    @bikes.last
  end

  private

  def full?
    @bikes.size > 19
  end

  def empty?
    @bikes.empty?
  end

end
