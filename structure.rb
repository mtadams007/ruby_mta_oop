class Line
  attr_reader :stops_arr, :name, :delays, :transfer_stations
  def initialize (stops_arr,name)
    @stops_arr = stops_arr
    @name = name
    @transfer_stations= {}
    @delays = true
  end

  def stops
    # puts @stops_arr
    @stops_arr
  end

  def add_transfer(hash)
    @transfer_stations = hash
  end
end

def check_transfer(line1, line2)
  if line2.transfer_stations.has_key? line1.name
    line2.transfer_stations[line1.name]
  else
    puts "Failure :("
  end

end

def mini_calc(start, stop, line)
  stops_arr = line.stops
  num_of_stops = stops_arr.index(stop) - stops_arr.index(start)
  num_of_stops.abs
end

def calculate(line1,start,line2,stop)
  if line1 == line2
    return mini_calc(start,stop,line1)
  else
    return mini_calc(start, check_transfer(line1,line2), line1)+mini_calc(check_transfer(line1,line2),stop,line2)

  end
end




# else
#   return mini_calc(start, "union_square", line1) + mini_calc("union_square", stop, line2)
