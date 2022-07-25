# frozen_string_literal: true

module Util
  @months = { '0' => '',
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

  def input_checks(input_args)
    (0...input_args.length).each do |i|
      case i
      when 0
        puts 'eception' if !input_args[i] == '-a' || '-c'
      when 1
        year, month = input_args[i].split('/')
        puts 'exception' if year.to_i > 2022
        puts 'exception' unless month in 1..12
      when 2
        puts 'exception' unless File.exist?(input_args[i])
      end
    end
  end

  def generate_file_path(path, year_n_month)
    filename = []
    filename.push(path.split('/')[-1])
    filename.push(year_n_month.split('/')[0])
    filename.push(year_n_month.split('/')[1])

    full_filename = filename.join('_')

    "#{path}#{full_filename}.txt"
  end

  def read_file(file_path)
    all_lines_in_file = []
    if File.file?(file_path)
      file_data = File.readlines(file_path, chomp: true)

      parsed_data = {}
      categories = file_data.shift.split(',')
      categories[0] = 'Date'
      categories.map(&:strip)
      parsed_data.keys = categories

      file_data.each do |line|
        # puts line
        values = line.split(',')
        values.map(&:strip)
        parsed_data.value = values
      end
      all_lines_in_file.push(parsed_data)
    else
      puts "File: #{file_path} not found"
    end
    all_lines_in_file
  end
end
