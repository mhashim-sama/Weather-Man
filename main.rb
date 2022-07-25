# frozen_string_literal: true

require './utilities'
module WeatherMan
  include Util

  def runner
    task = Util.input_checks(ARGV)
    if task == 'task1'
      task1(ARGV[2], ARGV[1])
    end
    file = Util.generate_file_path(ARGV[2], ARGV[1])
    file_data = Util.read_file(file)
    case task
    when 'task2'
      task2(file_data)
    when 'task3'
      task3(file_data)
    end
  end

  def task1(path, year)
    max_temp = 0
    max_temp_date = ''
    min_temp = 1000
    min_temp_date = ''
    max_humidity = 0
    max_humidity_date = ''
    all_files = Util.generate_multiple_file_path(path, year)
    all_files.each do |file|
      file_data = Util.read_file(file)
      file_data.each do |day|
        if max_temp < day['Max TemperatureC'].to_i
          max_temp = day['Max TemperatureC'].to_i
          max_temp_date = day['Date']
        end
        if min_temp > day['Min TemperatureC'].to_i && !day['Min TemperatureC'].nil?
          min_temp = day['Min TemperatureC'].to_i
          min_temp_date = day['Date']
        end
        if max_humidity < day['Max Humidity'].to_i
          max_humidity = day['Max Humidity'].to_i
          max_humidity_date = day['Date']
        end
      end
    end
    puts "Highest #{max_temp} on #{max_temp_date}"
    puts "Lowest #{min_temp} on #{min_temp_date}"
    puts "Most Humidity #{max_humidity} on #{max_humidity_date}"
  end

  def task2(file_data)
    avg_high_temp = 0
    avg_low_temp = 0
    avg_humidity = 0
    total = 0
    file_data.each do |day|
      avg_high_temp += day['Max TemperatureC'].nil? ? 0 : day['Max TemperatureC'].to_i
      avg_low_temp += day['Min TemperatureC'].nil? ? 0 : day['Min TemperatureC'].to_i
      avg_humidity += day['Mean Humidity'].nil? ? 0 : day['Mean Humidity'].to_i
      total += 1
    end
    puts "Average Highest Temprature = #{avg_high_temp / total}"
    puts "Average Lowest Temprature = #{avg_low_temp / total}"
    puts "Average Humidity = #{avg_humidity / total}"
  end

  def task3(file_data)
    file_data.each do |day|
      puts day['Date']
      Util.red_output(day['Max TemperatureC'].to_i)
      Util.blue_output(day['Min TemperatureC'].to_i)
    end
  end
end

include WeatherMan
WeatherMan.runner
