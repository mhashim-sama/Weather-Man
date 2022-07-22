require 'colorize'

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

# Parsing input
counter = 1
ARGV.each do |arg|
  puts arg
  case counter
  when 1
    task['option'] = arg
  when 2
    temp = arg.split('/')
    task['year'] = temp[0]
    task['month'] = if temp.length == 2
                      temp[1]
                    else
                      '0'
                    end
  when 3
    task['path'] = arg
  end
  counter += 1
  # puts counter
end

# Extracting file path
filename = []
filename.push(task['path'].split('/')[-1])
filename.push(task['year'])
filename.push(months[task['month']])

full_filename = filename.join('_')

file_path = "#{task['path']}#{full_filename}.txt"

# file_path = "#{task['path']}#{full_filename}"

#Task 2
def task2(file_path, months)
  # Reading data from file
  max_temp_list = []
  min_temp_list = []
  mean_humidity_list = []

  if File.file?(file_path)
    file_data = File.readlines(file_path, chomp: true)

    parsed_data = {}
    temp_categories = file_data[0].split(',')
    temp_categories.shift
    parsed_data['Date'] = nil
    temp_categories.each do |categories|
      parsed_data[categories.strip] = nil
    end
    file_data.shift

    file_data.each do |line|
      puts line

      temp_values = line.split(',')
      temp_values.map(&:strip)

      parsed_data = parsed_data.keys.zip(temp_values).to_h
      parsed_data.each do |cat, data|
        puts "#{cat} => #{data}"
      end

      # calculating average temp
      max_temp_list.push(parsed_data['Max TemperatureC'].to_i)

      min_temp_list.push(parsed_data['Min TemperatureC'].to_i)

      mean_humidity_list.push(parsed_data['Mean Humidity'].to_i)
    end
  else
    puts "File #{file_path} not found"
  end
  puts ''
  puts "Max Average Temprature: #{max_temp_list.sum / max_temp_list.size}"
  puts ''
  puts "Min Average Temprature: #{min_temp_list.sum / min_temp_list.size}"
  puts ''
  puts "Average Humidity: #{mean_humidity_list.sum / mean_humidity_list.size}"
  puts ''
end

# Task 3
def task3(file_path, months)
  if File.file?(file_path)
    file_data = File.readlines(file_path, chomp: true)

    parsed_data = {}
    temp_categories = file_data[0].split(',')
    temp_categories.shift
    parsed_data['Date'] = nil
    temp_categories.each do |categories|
      parsed_data[categories.strip] = nil
    end
    file_data.shift

    file_data.each do |line|
      puts line

      temp_values = line.split(',')
      temp_values.map(&:strip)

      parsed_data = parsed_data.keys.zip(temp_values).to_h
      parsed_data.each do |cat, data|
        puts "#{cat} => #{data}"
      end

      # generating output
      puts "#{parsed_data['Date']} Highest Temprature:"
      color_output(parsed_data['Max TemperatureC'].to_i, '+')

      puts "#{parsed_data['Date']} Lowest Temprature:"
      color_output(parsed_data['Min TemperatureC'].to_i, '-')

    end
  else
    puts "File #{file_path} not found"
  end
  puts ''
  puts "Max Average Temprature: #{max_temp_list.sum / max_temp_list.size}"
  puts ''
  puts "Min Average Temprature: #{min_temp_list.sum / min_temp_list.size}"
  puts ''
  puts "Average Humidity: #{mean_humidity_list.sum / mean_humidity_list.size}"
  puts ''
end

def color_output(value, symbol)
  output = ''
  until value >= 0 do
    output << symbol
    value -= 1
  end
  puts output
end

# Task 1
def task1(partial_file_path, months)
  max_temp = { 'Max TemperatureC' => '',
               'Date' => '' }
  min_temp = { 'Min TemperatureC' => '100',
               'Date' => '' }
  max_humidity = { 'Max Humidity' => '',
                   'Date' => '' }

  (1..12).each do |i|
    file_path = "#{partial_file_path}#{months[i.to_s]}.txt"
    if File.file?(file_path)
      file_data = File.readlines(file_path, chomp: true)

      parsed_data = {}
      temp_categories = file_data[0].split(',')
      temp_categories.shift
      parsed_data['Date'] = nil
      temp_categories.each do |categories|
        parsed_data[categories.strip] = nil
      end
      file_data.shift

      file_data.each do |line|
        puts line

        temp_values = line.split(',')
        temp_values.map(&:strip)

        parsed_data = parsed_data.keys.zip(temp_values).to_h
        parsed_data.each do |cat, data|
          puts "#{cat} => #{data}"
        end

        # Finding max temp
        if max_temp['Max TemperatureC'].to_i < parsed_data['Max TemperatureC'].to_i
          max_temp['Max TemperatureC'] = parsed_data['Max TemperatureC']
          max_temp['Date'] = parsed_data['Date']
        end

        # Finding max temp
        if (min_temp['Min TemperatureC'].to_i > parsed_data['Min TemperatureC'].to_i) && (parsed_data['Min TemperatureC'] != '')
          min_temp['Min TemperatureC'] = parsed_data['Min TemperatureC']
          min_temp['Date'] = parsed_data['Date']
        end

        # Finding max temp
        if max_humidity['Max Humidity'].to_i < parsed_data['Max Humidity'].to_i
          max_humidity['Max Humidity'] = parsed_data['Max Humidity']
          max_humidity['Date'] = parsed_data['Date']
        end
      end
    else
      puts "File #{file_path} not found"
    end
  end
  puts ''
  puts 'Max Temprature'
  puts max_temp
  puts ''
  puts 'Min Temprature'
  puts min_temp
  puts ''
  puts 'Max Humidity'
  puts max_humidity
  puts ''
end

#  task1(file_path, months)
# task2(file_path, months)
 task3(file_path, months)
