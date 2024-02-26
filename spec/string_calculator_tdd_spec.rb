require_relative '../lib/main'

RSpec.describe StringCalculatorTdd do
  describe "#add" do
    subject(:calculator) { StringCalculatorTdd.new }

    it "returns 0 for an empty string" do
      expect(calculator.add('')).to eq(0)
    end

    it 'returns the single number for an input with one number' do
      expect(calculator.add('123')).to eq(123)
    end

    it 'adds multiple numbers separated by commas' do
      expect(calculator.add('1,2,3')).to eq(6)
    end

    it "raises ArgumentError for non-string input" do
      expect { calculator.add(1) }.to raise_error(ArgumentError, "Input must be a string")
    end

    it "removes empty spaces between string and returns the sum of multiple numbers separated by commas" do
      expect(calculator.add("1 1, 1 1, 1 1")).to eq(33)
    end

    it 'handles newlines as delimiters' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it "raises ArgumentError for invalid input with a comma followed by a newline" do
      expect { calculator.add("1,\n2") }.to raise_error(ArgumentError)
    end

    it "raises ArgumentError for invalid input with a newline followed by a comma" do
      expect { calculator.add("1,\n2") }.to raise_error(ArgumentError)
    end

    it "changes delimiter at the beginning of the string" do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it "changes delimiter with new lines" do
      expect(calculator.add("//*\n1\n2*3\n4")).to eq(10)
    end

    it "changes delimiter with mixed delimiters" do
      expect(calculator.add("//#\n1\n2,3\n4#5")).to eq(15)
    end

    it "changes delimiter with different numbers" do
      expect(calculator.add("//;\n1;2;3")).to eq(6)
    end

    it "raises ArgumentError for invalid input with a custom delimiter" do
      expect { calculator.add("//;\n1;\n1") }.to raise_error(ArgumentError)
    end

    it "throws an exception for a single negative number" do
      expect { calculator.add('-1') }.to raise_error(ArgumentError, "Negative numbers not allowed: -1")
    end

    it 'throws an exception for multiple negative numbers' do
      expect { calculator.add('-1,-2,-3') }.to raise_error(ArgumentError, "Negative numbers not allowed: -1, -2, -3")
    end
  end
end
