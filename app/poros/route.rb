class Route 
  attr_reader :distance,
              :travel_time,
              :instructions
  def initialize(route_info)
    @distance = route_info[:distance]
    @travel_time = route_info[:formattedTime]
    @maneuvers = route_info[:legs][0][:maneuvers]
    @instructions = all_maneuvers
  end

  def all_maneuvers 
    @maneuvers.map do |maneuver| 
      # require 'pry'; binding.pry
      maneuver[:narrative]
    end.join(" ")
  end

end