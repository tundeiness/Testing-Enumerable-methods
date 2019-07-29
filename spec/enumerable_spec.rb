# frozen_string_literal: true

require_relative '../lib/enumerable.rb'

describe Enumerable do
  let(:arr){ [1, 2, 3, 4, 5] }

  describe '#my_each' do
    let(:response) { [] }
    it 'iterates and display each element of an array' do
      arr.each { |x| response << x }
      expect(response).to eq(arr)
    end
  end

  describe '#my_each_with_index' do
    let(:response){ [] }
    it 'iterates over an array if a block is given' do
      arr.my_each_with_index { |_item, idx| response << idx }
      expect(response).to eq([0, 1, 2, 3, 4])
    end
  end

  describe '#my_count' do
    it 'returns the number of element when a block is provided' do
      response = arr.my_count{|elem| elem > 4}
      res = arr.my_count{|elem| elem > 1}
      expect(response).to eq(1)
      expect(res).to eq(4)
    end

    it 'returns the number ofelements in ana array when no block is provided' do
      expect(arr.my_count).to eq(5)
    end
  end
end
