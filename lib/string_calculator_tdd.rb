class StringCalculatorTdd
  def add(string)
    # Ensure input is a string
    raise ArgumentError, "Input must be a string" unless string.is_a?(String)

    # Handle empty string case
    return 0 if string.empty?

    # Handle multiple numbers separated by commas
    if string.include?(',')
      numbers = string.split(',').map(&:to_i)
      return numbers.sum
    end

    # Handle single number case
    string.to_i
  end
end

# Check for input argument
if ARGV.length > 0
  input = ARGV[0]
  puts "Calculating for: #{input}"
  puts "Result: #{StringCalculatorTdd.new.add(input)}"
else
  puts "Error: No input provided."
end
