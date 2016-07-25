def handle_num(first_num)
  sum = first_num.to_f
  count = 1
  loop do
    num = gets.chomp
    if num.empty?
      break
    elsif !is_num?(num)
      puts "Must input only strings or only numbers"
      gets
      exit
    end
    sum += num.to_f
    count += 1
  end
  puts "Total of all the numbers: #{sum}"
  puts "Average of all the numbers: #{sum/count}"
end

def handle_string(first_str)
  word = first_str
  loop do
    str = gets.chomp
    if str.empty?
      break
    elsif is_num?(str)
      puts "Must input only strings or only numbers"
      gets
      exit
    end
    word += str
  end
  puts word
end

def is_num?(input)
  return input.to_f.to_s == input || input.to_i.to_s == input
end

puts "Hello, please enter some numbers or some strings"
input = gets.chomp
if input.empty?
  exit
elsif is_num?(input)
  handle_num(input)
else
  handle_string(input)
end
