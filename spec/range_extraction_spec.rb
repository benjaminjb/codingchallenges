require 'spec_helper'

describe RangeEx do
  it "should return a string of ranges" do
    rng1 = [-12, -9, -2, -1, 0, 4, 8, 15, 17, 18, 19, 20, 44]
    ans1 = '-12,-9,-2-0,4,8,15,17-20,44'
    response1 = RangeEx.parse(rng1)

    rng2 = [1000, 1182, 1183, 1184, 1186, 2229, 2230, 4999, 5000]
    ans2 = '1000,1182-1184,1186,2229,2230,4999,5000'
    response2 = RangeEx.parse(rng2)

    rng3 = (1..20).to_a
    ans3 = '1-20'
    response3 = RangeEx.parse(rng3)

    expect(response1).to eq(ans1)
    expect(response2).to eq(ans2)
    expect(response3).to eq(ans3)
  end

  describe 'extensions' do
    it 'raises an error if the list is not an Array' do
      data = {}
      expect { RangeEx.parse(data) }.to raise_error
    end
    
    it 'works with nested lists' do
      rng = [-12, -9, -2, [-1, 0, 4, 8], 15, 17, [18, 19], 20, 44]
      ans = '-12,-9,-2-0,4,8,15,17-20,44'
      response = RangeEx.parse(rng)
      expect(response).to eq(ans)
    end

    it 'works with letters' do
      rng = [5, 11, 12, 13, 'a', 'f', 'g', 'h', 'i', 19, 20]
      ans = '5,11-13,a,f-i,19,20' 
      response = RangeEx.parse(rng)
      expect(response).to eq(ans)
    end
  end
end