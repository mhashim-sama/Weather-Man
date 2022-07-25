# frozen_string_literal: true

require './utilities'
include WeatherMan

module WeatherMan
  include Util

  def runner
    task = Util.input_checks(ARGV)
    file = Util.generate_file_path(ARGV[2], ARGV[1])
    file_data = Util.read_file(file)
    case task
    when 'task2'
      task2(file_data)
    when 'task3'
      task3(file_data)
    end
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

WeatherMan.runner
