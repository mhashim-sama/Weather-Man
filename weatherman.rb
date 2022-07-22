# frozen_string_literal: true

puts 'Starting Weather Man'

months = { '1' => 'Jan',
           '2' => 'Feb',
           '3' => 'Mar',
           '4' => 'Apr',
           '5' => 'May',
           '6' => 'Jun',
           '7' => 'Jul',
           '8' => 'Aug',
           '9' => 'Sep',
           '10' => 'Oct',
           '11' => 'Nov',
           '12' => 'Dec' }
task = {}

counter = 1
ARGV.each do |arg|
  puts arg
  case counter
  when 1
    task['option'] = arg
  when 2
    task['date'] = arg
  when 3
    task['path'] = arg
  end
  counter += 1
  puts counter
end

puts task
puts months
