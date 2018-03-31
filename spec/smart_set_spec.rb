require './lib/smart_set'

describe SmartSet do
	describe '#given_arguments' do
		before(:each) { 
			@smart = SmartSet.new
			@smart.test_case = 1
			@smart.arr_size = 3
			@smart.arr_ele = [1,3,4]
		}
		it 'given number of testcases should not be nil' do
			expect(@smart.test_case).not_to be_nil 
		end
		it 'given testcase count should be an Integer' do
			expect(@smart.test_case).to be_an(Integer)
		end
		it 'should be between 0 and 1000' do
			minimum = 0
			maximum = 1000
			expect(@smart.test_case).to be_between(minimum, maximum).exclusive
		end
		it 'size of array should not be nil' do
			expect(@smart.arr_size).not_to be_nil 
		end
		it 'size of array should be an Integer' do
			expect(@smart.arr_size).to be_an(Integer) 
		end
		it 'should be between 2 to 10000' do
			minimum = 2
			maximum = 10000
			expect(@smart.arr_size).to be_between(minimum, maximum).exclusive
		end
		it 'should be array' do
			expect(@smart.arr_ele).to be_an_instance_of(Array) 
		end
		it 'array should not be empty' do
			expect(@smart.arr_ele).not_to be_empty 
		end
		it 'array is out of bound' do
			expect(@smart.arr_ele.length).to eq(@smart.arr_size)
		end
		it "returns true if self has a Integer" do
		    expect(@smart.arr_ele).not_to include(a_kind_of(String))
		    expect(@smart.arr_ele).not_to include(a_kind_of(Float))
		end
		it 'output' do
			@smart.find_smart_set(1, 3,[1,3,4]).should match_array([1,3])
		end
	end
	
end
	