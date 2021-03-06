require_relative 'bike'

class DockingStation

  attr_accessor :capacity, :broken_bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail "cannot release a broken bike" if bikes.last.broken?
    bikes.pop
  end

  # def release_broken_bike
  #   fail 'No bikes available' if empty?
  #   broken_bikes = bikes.select { |bike| bike.broken? }

  def release_broken_bikes
    fail 'No bikes available' if empty?
    bikes.each do |bike|
      if bike.broken?
        broken_bikes << bike
        bikes.delete(bike)
      end
    end
  fail "There are no broken bikes available" if broken_bikes == []
  broken_bikes
  end

  def dock(bike)
    fail 'Already full' if full?
    bikes << bike
  end

  private

  attr_reader :bikes

  def empty?
    bikes.empty?
  end

  def full?
    bikes.length >= capacity
  end
end