# frozen_string_literal: true

require_relative '../lib/enumerable.rb'

describe Enumerable do
  let(:arr) { [1, 2, 3, 4, 5] }

  describe '#my_each' do
    let(:response) { [] }
    it 'iterates and display each element of an array' do
      arr.each { |x| response << x }
      expect(response).to eq(arr)
    end
  end

  describe '#my_each_with_index' do
    let(:response) { [] }
    it 'iterates over an array if a block is given' do
      arr.my_each_with_index { |_item, idx| response << idx }
      expect(response).to eq([0, 1, 2, 3, 4])
    end
  end

  describe '#my_count' do
    it 'returns the number of element when a block is provided' do
      response = arr.my_count { |elem| elem > 4 }
      res = arr.my_count { |elem| elem > 1 }
      expect(response).to eq(1)
      expect(res).to eq(4)
    end

    it 'returns the number of elements in an array when no block is provided' do
      expect(arr.my_count).to eq(5)
    end
  end

  describe '#my_select' do
    it 'iterates an array to produce elements for which the given block is true' do
      response = arr.my_select(&:odd?)
      expect(response).to eq([1, 3, 5])
    end
  end

  describe '#my_all?' do
    it 'returns false when one of the elements does not meet the block condition' do
      ans = arr.my_all? { |elem| elem != 2 }
      expect(ans).to be(false)
    end

    it 'becomes truthy if all elements meet the block condition' do
      ans = arr.my_all? { |elem| elem < 6 }
      expect(ans).to be(true)
    end
  end

  describe '#my_any?' do
    it 'returns true if the block ever returns a value different from false or nil' do
      ans = arr.my_any? { |elem| elem == 5 }
      expect(ans).to be(true)
    end

    it 'returns false if none of the elements meet the block condition' do
      ans = arr.my_any? {|elem| elem == 0}
      expect(ans).to be(false)
    end
  end


end
