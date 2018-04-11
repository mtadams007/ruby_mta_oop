class Line
  attr_reader :stops_arr :name :delays
  def initialize (stops_arr,name)
    @stops_arr = stops_arr
    @name = name
    @delays = true
  end

  def stops
    puts @stops_arr
    @stops_arr
  end
end

def calculate(line1,start,line2,stop)
  if line1 == line2
    stops_arr = line1.stops
    
