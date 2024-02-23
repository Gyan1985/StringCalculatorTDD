class StringCalculatorTdd
  def add(string)
    return 0 if string.empty?

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
