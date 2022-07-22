# frozen_string_literal: true

puts 'Starting Weather Man'

# filepath = /Users/dev/Documents/Resources/Project-Based/weatherman-resources/Dubai_weather/Dubai_weather_2004_Aug.txt

months = { '0' => '',
           '1' => 'Jan',
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
    temp = arg.split('/')
    task['year'] = temp[0]
    if temp.length == 2
      task['month'] = temp[1]
    else
      task['month'] = '0'
    end
  when 3
    task['path'] = arg
  end
  counter += 1
  puts counter
end

filename = []
filename.push(task['path'].split('/')[-1])
filename.push(year = task['year'])
filename.push(months[task['month']])

full_filename = filename.join('_')

file_path = task['path'] + full_filename + '.txt'

puts file_path
