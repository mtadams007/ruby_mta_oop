

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

#need this to check different keys
lines = ['F','N','L','Q','6']

def check_transfer(line1, line2)
  # puts line1
  # puts line2
  if line2.transfer_stations.has_key? line1.name
    return line2.transfer_stations[line1.name]
  else
    return false
  end
end

def mini_calc(start, stop, line)
  stops_arr = line.stops
  # puts stop
  # puts start
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
def multiple_transfers(line1,line2,lines=['F','N','L','Q','6'])
  possibilities=[]
  i=0
  length=lines.length
  while i<length
    if line1.transfer_stations.has_key?(lines[i]) && line2.transfer_stations.has_key?(lines[i])
      possibilities.push(lines[i])
      puts 'check'
      # return possibilities
       # possibilities
    end
      # puts possibilities
      i+=1
  end
  return possibilities
end

def transferring_thrice(line1,line2,line3,start, transfer1, transfer2,stop)
  return mini_calc(start,transfer1,line1) + mini_calc(transfer1,transfer2,line3) + mini_calc(transfer2,stop,line2)
end
# else
#   return mini_calc(start, "union_square", line1) + mini_calc("union_square", stop, line2)
