# frozen_string_literal: true

require 'colorize'
require 'Date'

module Util
  def input_checks(input_args)
    task = ''
    (0...input_args.length).each do |i|
      case i
      when 0
        case input_args[i]
        when '-a'
          task = 'task2'
        when '-c'
          task = 'task3'
        else
          puts exception
        end
      when 1
        year = input_args[i].split('/')[0]
        # month = input_args[i].split('/')[1]
        puts 'exception' if year.to_i > 2022
        # puts 'exception' unless month.to_i in 1..12
      when 2
        puts 'exception' unless File.exist?(input_args[i])
      end
    end
    task
  end

  def generate_file_path(path, year_n_month)
    filename = []
    filename.push(path.split('/')[-1])
    filename.push(year_n_month.split('/')[0])
    filename.push(Date::ABBR_MONTHNAMES[year_n_month.split('/')[1].to_i])

    full_filename = filename.join('_')

    "#{path}#{full_filename}.txt"
  end

  def read_file(file_path)
    all_lines_in_file = []
    if File.file?(file_path)
      file_data = File.readlines(file_path, chomp: true)

      parsed_data = {}
      categories = file_data.shift.split(',')
      categories[0] = +'Date'
      categories.map(&:strip!)

      file_data.each do |line|
        # puts line
        values = line.split(',')
        values.map(&:strip!)
        parsed_data = categories.zip(values).to_h
        all_lines_in_file.push(parsed_data)
      end
    else
      puts "File: #{file_path} not found"
    end
    all_lines_in_file
  end

  def red_output(value)
    output = +''
    while value.positive?
      output << '+'
      value -= 1
    end
    puts output.red
  end

  def blue_output(value)
    output = +''
    while value.positive?
      output << '+'
      value -= 1
    end
    puts output.blue
  end
end
