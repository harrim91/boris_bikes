require_relative "bike"
class DockingStation
  attr_reader :bike

  def release_bike
    raise "Docking Station is empty" unless @bike
    @bike
  end

  def dock(bike)
    raise "Docking station is full" if @bike
    @bike = bike
  end

end
