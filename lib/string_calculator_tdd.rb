class StringCalculatorTdd
  def add(string)
    # Ensure input is a string
    raise ArgumentError, "Input must be a string" unless string.is_a?(String)

    # Handle empty string case
    return 0 if string.empty?

    return string.to_i if is_a_number?(string)

    # Split by both commas and new lines, then map each part to integer and sum them up
    numbers = string.delete(' ').split(/[,\n]/)

    # Check if the string ends with a comma or \n, or if there are consecutive delimiters
    raise ArgumentError, "Invalid input" if numbers.any?(&:empty?)

    numbers.map(&:to_i).sum
  end

  private

  def is_a_number?(string)
    begin
      Integer(string)
      true
    rescue ArgumentError
      false
    end
  end
end

# Check for input argument
if ARGV.length > 0
  input = ARGV[0]
  puts "Calculating for: #{input}"
  begin
    puts "Result: #{StringCalculatorTdd.new.add(input)}"
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end
else
  puts "Error: No input provided."
end
