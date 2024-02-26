class StringCalculatorTdd
  def add(string)
    # Ensure input is a string
    raise ArgumentError, "Input must be a string" unless string.is_a?(String)

    # Handle empty string case
    return 0 if string.empty?

    return string.to_i if is_a_number?(string)

    default_delimiter = ','

    if string.start_with?("//")
      delimiter_declaration, numbers = string.split("\n", 2)
      custom_delimiter = delimiter_declaration[2..-1]
    else
      numbers = string
    end

    splitted_numbers = split_numbers(numbers, custom_delimiter || default_delimiter)

    raise ArgumentError, "Invalid input" if splitted_numbers.any?(&:empty?)

    splitted_numbers.map(&:to_i).sum
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

  def split_numbers(numbers, delimiter)
    numbers.delete(' ').split(/#{Regexp.escape(delimiter)}|,|\n/)
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
