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
  end
end
