require_relative "structure.rb"

# Variables

Q = Line.new(["times_square", "herald_square", "union_square", "canal_st"],'Q')

N = Line.new(['times_square', '34th', '28th', '23rd', 'union_square', '8th'], "N")
L = Line.new(["8th", "6th", "union_square", "3rd", "1st"], "L")
F = Line.new(["rockefeller_center", "42nd", "herald_square", "23rd", "14th", "West 4th"], "F")
six = Line.new(["grand_central", "33rd", "28th", "23rd", "union_square", "astor_place"], '6')

q_transfer = {L.name=>"union_square",N.name=>"union_square",six.name=>"union_square", F.name=>"herald_square"}
n_transfer = {L.name=>"union_square",Q.name=>"union_square",six.name =>"union_square"}
l_transfer = {N.name => "union_square",Q.name=>"union_square",six.name=>"union_square"}
f_transfer = {Q.name=>"herald_square"}
six_transfer = {L.name=>"union_square",N.name=>"union_square",Q.name=>"union_square"}

Q.add_transfer(q_transfer)
N.add_transfer(n_transfer)
L.add_transfer(l_transfer)
F.add_transfer(f_transfer)
six.add_transfer(six_transfer)

lines = ['F','N','L','Q','6']
lines_hash = {'N' => N, 'L'=> L, "6" => six, "F" => F, "Q"=>Q}

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
  if input[0] == "calculate" && lines.include?(input[1]) && lines.include?(input[3]) && check_transfer(lines_hash[input[1]],lines_hash[input[3]])
    puts calculate(lines_hash[input[1]],input[2], lines_hash[input[3]], input[4])
    #checking best two transfers
  elsif input[0] == "calculate" && lines.include?(input[1]) && lines.include?(input[3])
    transfers = multiple_transfers(lines_hash[input[1]],lines_hash[input[3]],lines)
    if transfers.length == 1
      # puts lines_hash[transfers[0]]
      line_1 = lines_hash[input[1]]
      line_2 = lines_hash[input[3]]
      line_3 = lines_hash[transfers[0]]
      puts transferring_thrice(line_1,line_2,line_3, input[2],check_transfer(line_1,line_3),check_transfer(line_3,line_2),input[4])
    end
  elsif input[0] == "calculate"
    puts "Please input existing lines"
  else
    puts "Due to an ongoing investigation at Canal Street we will be delayed momentarily"
  end
else
  puts "Please input a proper command"
end

transferring_thrice(F,six,Q,'42nd',  'herald_square', 'union_square', 'astor_place')
# puts multiple_transfers(six,F)
