require_relative "bike"
class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize capacity= DEFAULT_CAPACITY
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    working_bikes = @bikes.select { |bike| bike.working? }
    raise "No working bikes available" if working_bikes.empty?
    @bikes.delete(working_bikes.first)
  end

  def dock(bike)
    raise "Docking station is full" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.size >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
