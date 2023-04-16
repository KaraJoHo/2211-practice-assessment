class Station 
  attr_reader :name,
              :fuel_type,
              :address,
              :access_time,
              :state,
              :city,
              :zip

  def initialize(station_info)
    @name = station_info[:station_name]
    @fuel_type = station_info[:fuel_type_code]
    @address = station_info[:street_address]
    @access_time = station_info[:access_days_time]
    @city = station_info[:city]
    @state = station_info[:state]
    @zip = station_info[:zip]
  end

  def full_address 
    "#{@address}, #{@city}, #{state} #{@zip}"
  end
end