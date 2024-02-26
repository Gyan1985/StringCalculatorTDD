require_relative '../lib/string_calculator_tdd'

RSpec.describe "StringCalculatorTdd" do
  describe "#add" do
    it "returns 0 for an empty string" do
      expect(StringCalculatorTdd.new.add('')).to eq(0)
    end

    it 'returns the single number for an input with one number' do
      expect(StringCalculatorTdd.new.add('123')).to eq(123)
    end

    it 'adds multiple numbers separated by commas' do
      expect(StringCalculatorTdd.new.add('1,2,3')).to eq(6)
    end

    it "raises ArgumentError for non-string input" do
      expect { StringCalculatorTdd.new.add(1) }.to raise_error(ArgumentError, "Input must be a string")
    end

    it "remove empty spaces b/w string and return sum of multiple numbers separated by commas" do
      expect(StringCalculatorTdd.new.add("1 1, 1 1, 1 1")).to eq(33)
    end

    it 'handles newlines as delimiters' do
      expect(StringCalculatorTdd.new.add("1\n2,3")).to eq(6)
    end

    it "raises ArgumentError for invalid input with comma followed by new line" do
      expect { StringCalculatorTdd.new.add("1,\n2") }.to raise_error(ArgumentError)
    end

    it "raises ArgumentError for invalid input with new line followed by comma" do
      expect { StringCalculatorTdd.new.add("1,\n2") }.to raise_error(ArgumentError)
    end

    it "change delimiter at the beginning of the string" do
      expect(StringCalculatorTdd.new.add("//;\n1;2")).to eq(3)
    end

    it "change delimiter with new lines" do
      expect(StringCalculatorTdd.new.add("//*\n1\n2*3\n4")).to eq(10)
    end

    it "change delimiter with mixed delimiters" do
      expect(StringCalculatorTdd.new.add("//#\n1\n2,3\n4#5")).to eq(15)
    end

    it "change delimiter with different numbers" do
      expect(StringCalculatorTdd.new.add("//;\n1;2;3")).to eq(6)
    end

    it "raises ArgumentError for invalid input with custom delimiter" do
      expect { StringCalculatorTdd.new.add("//;\n1;\n1") }.to raise_error(ArgumentError)
    end

    it "throws an exception for a single negative number" do
      expect { StringCalculatorTdd.new.add('-1') }.to raise_error(ArgumentError, "Negative numbers not allowed: -1")
    end

    it 'throws an exception for multiple negative numbers' do
      expect { StringCalculatorTdd.new.add('-1,-2,-3') }.to raise_error(ArgumentError, "Negative numbers not allowed: -1, -2, -3")
    end
  end
end
