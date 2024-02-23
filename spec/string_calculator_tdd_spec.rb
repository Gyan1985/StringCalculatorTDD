require_relative '../lib/string_calculator_tdd'

RSpec.describe "StringCalculatorTdd" do
  describe "#add" do
    it "returns 0 for an empty string" do
      expect(StringCalculatorTdd.new.add('')).to eq(0)
    end

    it 'returns the single number for an input with one number' do
      expect(StringCalculatorTdd.new.add('123')).to eq(123)
    end
  end
end
