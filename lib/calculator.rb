# frozen_string_literal: true

module StringCalculator
  module Calculator
    def add(string)
      raise ArgumentError, 'Input must be a string' unless string.is_a?(String)

      return 0 if string.empty?

      numbers = extract_numbers(string)
      validate_numbers(numbers)

      numbers.map(&:to_i).sum
    end

    private

    def extract_numbers(string)
      if string.start_with?('//')
        delimiter_declaration, numbers = string.split("\n", 2)
        custom_delimiter = delimiter_declaration[2..]
      else
        custom_delimiter = nil
        numbers = string
      end

      split_numbers(numbers, custom_delimiter || ',')
    end

    def split_numbers(numbers, delimiter)
      numbers &&= numbers.delete(' ')
      numbers&.split(/#{Regexp.escape(delimiter)}|,|\n/)
    end

    def validate_numbers(numbers)
      raise ArgumentError, 'Invalid input' if numbers&.any?(&:empty?)

      negatives = numbers&.select { |num| num.to_i.negative? }
      raise ArgumentError, "Negative numbers not allowed: #{negatives.join(', ')}" if negatives&.any?
    end
  end
end
