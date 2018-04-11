require_relative "structure.rb"

lines = ['F','N','L','Q','6']
lines_hash = {'N' => $N, 'L'=> $L, "6" => $six, "F" => $F, "Q"=>$Q}

input = ARGV
length = input.length

if input[0] == "calculate" && length != 5
  puts "You must provide the 4 arguments - STARTINGLINE STOP ENDINGLINE STOP"
elsif length == 1
  if input[0] == "lines"
    puts lines
  else
    puts "I'm sorry there is a signal malfunction"
  end
elsif length == 2
  if lines.include?(input[1]) && input[0] == "stops"
    puts lines_hash[input[1]].stops
  elsif input[0] == "stops"
    puts "The #{input[1]} line is coming soon in 2087!"
  else
    puts "I'm sorry there is a sick passenger at Dekalb Avenue"
  end
elsif length == 5
  if input[0] == "calculate" && lines.include?(input[1]) && lines.include?(input[3])
    puts calculate(lines_hash[input[1]],input[2], lines_hash[input[3]], input[4])
  elsif input[0] == "calculate"
    puts "Please input existing lines"
  else
    puts "Due to an ongoing investigation at Canal Street we will be delayed momentarily"
  end
else
  puts "Please input a proper command"
end
