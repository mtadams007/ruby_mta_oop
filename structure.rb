class Line
  attr_reader :stops_arr, :name, :delays
  def initialize (stops_arr,name)
    @stops_arr = stops_arr
    @name = name
    @delays = true
  end

  def stops
    # puts @stops_arr
    @stops_arr
  end
end

def calculate(line1,start,line2,stop)
  if line1 == line2
    stops_arr = line1.stops
    num_of_stops = stops_arr.index(stop) - stops_arr.index(start)
    p  num_of_stops.abs
  end
end

N = Line.new(['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'], "N")

# p N.stops
# p N
calculate(N,'34th', N, "23rd")
calculate(N,'23rd', N, "Times Square")
