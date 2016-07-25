include Math

def handle_num(first_num)
  num_array = []
  num_array << first_num.to_f
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
    num_array << num.to_f
    sum += num.to_f
    count += 1
  end
  avg = sum/count
  median = get_median(num_array)
  deviations = 0
  num_array.each do |val|
    deviations += (val - avg)**2
  end
  variance = deviations / num_array.length
  std_dev = Math.sqrt(variance)
  puts "Total of all the numbers: #{sum}"
  puts "Average of all the numbers: #{avg}"
  puts "Standard deviation: #{std_dev}"
  puts "Median value: #{median}"
end

def handle_string(first_str)
  word = first_str
  str_count = 1
  e_count = first_str.count('e')
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
    str_count += 1
    e_count += str.count('e')
  end
  puts word
  puts "The average string length was #{word.length.to_f / str_count}"
  puts "The letter e was used #{e_count} times"
end

def is_num?(input)
  return input.to_f.to_s == input || input.to_i.to_s == input
end

def get_median(array)
  array.sort!
  if array.length.odd?
    return array[array.length/2]
  else
    return (array[array.length/2] + array[array.length/2 -1]) /2
  end
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
