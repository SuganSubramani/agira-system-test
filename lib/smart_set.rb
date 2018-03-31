class SmartSet

	attr_accessor :test_case,:arr_size,:arr_ele
	
	def find_smart_set(test_case, arr_size, arr_ele )
		test_min, test_max = 0, 1000
		arr_min, arr_max = 2, 10000
		ele_min, ele_max = 1, 100000
		@list_of_array = Array.new
		begin
			# print "Enter the number of testcases ( 1 to 999) : "
			# p test_case.is_a?(Integer)
			# test_case = Integer(gets.chomp)
			if test_case <= test_min || test_case >= test_max
				raise RangeError, "Value of testcases outside bounds of #{test_min} to #{test_max}."
			else
				for i in (1..test_case)
					# print "Enter the size of the array #{i} case : "
					# arr_size = Integer(gets.chomp) 
					if arr_size <= 2 || arr_size >= 10000
						raise RangeError, "Size of the array outside bounds of #{arr_min} to #{arr_max}."
					else
						# print "Enter the array elements : "
						# arr_ele =1 gets.chomp.split().map { |e| (Integer(e) < ele_min || Integer(e) > ele_max) ? (raise RangeError, "element of the array outside bounds of #{ele_min} to #{ele_max}.") : Integer(e) }
						raise IndexError if arr_ele.length > arr_size || arr_ele.length < arr_size
						@list_of_array << arr_ele
					end
				end
			end
			ind_arr = Array.new
			smart_set = Hash.new
			tmp = 0
			if !@list_of_array.nil?
				seq = 0
				for l in (0..@list_of_array.size)
					ind_arr = @list_of_array[l]
					temp_hash = {}
					if !ind_arr.nil?
						ind_arr.each do |arr_val|
							num = arr_val
							if (num == 0) then 0 end
							bin_val = ""
							while(num != 0)
							    bin_val = String(num % 2) + bin_val
							    num = num / 2
							end
							count = bin_val.count('1')
							temp_list = Array.new
							if temp_hash.keys.include?(count)
								temp_list << arr_val
								temp_hash[count] << arr_val
							else
								if !temp_hash[count].nil?
									temp_list = temp_hash[count]
								end
								temp_list << arr_val
								temp_hash[count] = temp_list.sort
							end
						end
					end
					smart_set[seq] = temp_hash
					seq = seq + 1
				end
			end
			smart_set
			smart_set.keys.each do |k|
				temp_list2 = []
				if !smart_set[k].nil?
					smart_set[k].keys.sort.each do |k1|
						if !smart_set[k].nil?
			    			temp_list2 << smart_set[k][k1].sort[0]
			    		end
			    	end
			    end
				temp_list2.sort.each do |a|
			    	print(a,' ')
			    end
				puts('')
				return temp_list2
			end
		rescue ArgumentError
			p "Not an int, doing something else"
		rescue RangeError => e
			p e.message
		rescue IndexError
			p "Array out of index"
		end
	end
end

# SmartSet.new.find_smart_set


