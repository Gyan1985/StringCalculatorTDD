# frozen_string_literal: true

# lib/main.rb
require_relative 'lib/calculator'

class StringCalculatorTdd
  include StringCalculator::Calculator
end

if ARGV.length.positive?
  input = ARGV[0]
  puts "Calculating for: #{input}"

  begin
    calculator = StringCalculatorTdd.new
    result = calculator.add(input)
    puts "Result: #{result}"
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end
else
  puts 'Error: No input provided.'
end
