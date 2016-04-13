require_relative "bike"
class DockingStation
  attr_reader :bike

  def release_bike
    raise "Docking Station is empty" unless @bike
    Bike.new
  end

  def dock(bike)
    @bike = bike
  end

end
