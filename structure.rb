class Line
  attr_reader :stops_arr, :name, :delays, :transfer_stations
  def initialize (stops_arr,name, transfer_stations)
    @stops_arr = stops_arr
    @name = name
    @transfer_stations= transfer_stations
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
  elsif line1
    return mini_calc(start, "union_square", line1) + mini_calc("union_square", stop, line2)
  end
end

# Variables

$Q = Line.new(["times_square", "herald_square", "union_square", "canal_st"],'Q',{"times_square"=>[$N],"union_square"=>[$L,$N,$six], "herald_square"=>[$F]})

$N = Line.new(['times_square', '34th', '28th', '23rd', 'union_square', '8th'], "N", {"times_square"=>[$Q],"union_square"=>[$L,$Q,$six]})
$L = Line.new(["8th", "6th", "union_square", "3rd", "1st"], "L", {"union_square"=>[$N,$Q,$six]})
$F = Line.new(["rockefeller_center", "42nd", "herald_square", "23rd", "14th", "West 4th"], "F", {"herald_square"=>[$Q]})
$six = Line.new(["grand_central", "33rd", "28th", "23rd", "union_square", "astor_place"], '6', {"union_square"=>[$L,$N,$Q]})

lines = ['F','N','L','Q','6']
lines_hash = {'N' => $N, 'L'=> $L, "6" => $six, "F" => $F, "Q"=>$Q}
# N = Line.new(['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'], "N")
#
# L = Line.new(["8th", "6th", "Union Square", "3rd", "1st"], "L")
# p N.stops
# p N
