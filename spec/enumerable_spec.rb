require_relative '../lib/enumerable.rb'


describe Enumerable do

  let(:arr){[1, 2, 3, 4, 5]}

  describe '#my_each' do
    let(:response){[]}
    it 'iterates and display each element of an array' do
      arr.each{|x| response << x}
      expect(response).to eq(arr)
    end
  end

  describe '#my_each_with_index' do
    let(:response){[]}
    it 'iterates over an array if a block is given' do
      arr.my_each_with_index{|item,idx| response << idx}
      expect(response).to eq([0,1,2,3,4])
    end
  end

end
