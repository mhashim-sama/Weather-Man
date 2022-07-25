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
        puts 'eception' if !input_args[i] == '-e' || '-a' || '-c'
      when 1
        year, month = input_args[i].split('/')
        puts 'exception' if year.to_i > 2022
        puts 'exception' if !(month in 1..12) && month != ''
      when 2
        puts 'exception' unless File.exist?(input_args[i])
      end
    end
  end
end
