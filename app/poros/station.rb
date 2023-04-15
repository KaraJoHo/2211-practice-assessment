class Station 
  attr_reader :name,
              :fuel_type,
              :address,
              :access_time

  def initialize(station_info)
    @name = station_info[:station_name]
    @fuel_type = station_info[:fuel_type_code]
    @address = station_info[:street_address]
    @access_time = station_info[:access_days_time]
  end
end