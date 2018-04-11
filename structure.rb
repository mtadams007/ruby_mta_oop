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

def mini_calc(start, stop, line)
  stops_arr = line.stops
  num_of_stops = stops_arr.index(stop) - stops_arr.index(start)
  num_of_stops.abs
end

def calculate(line1,start,line2,stop)
  if line1 == line2
    return mini_calc(start,stop,line1)
  else
    return mini_calc(start, "Union Square", line1) + mini_calc("Union Square", stop, line2)
  end
end

N = Line.new(['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'], "N")

L = Line.new(["8th", "6th", "Union Square", "3rd", "1st"], "L")
# p N.stops
# p N
puts calculate(N,'23rd', N, "Times Square")
puts calculate(L, '1st', N, "34th")
