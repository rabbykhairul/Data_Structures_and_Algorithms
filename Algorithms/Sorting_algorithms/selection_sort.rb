# ======
# Time Complexity: ~ O(N^2 / 2) ~ O(N^2)
# Space Complexity: O(1)
# ======

def selection_sort!(array)
    (0...array.length).each do |idx1|
        lowest_value_index = idx1

        (idx1 + 1...array.length).each do |idx2|
            if array[ lowest_value_index ] > array[ idx2 ]
                lowest_value_index = idx2
            end
        end

        # swap the lowest value with the current first unsorted index
        unless lowest_value_index == idx1
            array[ idx1 ], array[ lowest_value_index ] = array[ lowest_value_index ], array[ idx1 ]
        end
    end

    array
end

# Test Cases:
puts

arr1 = [ 10, 50, 20, 5, 2, 0, 10 ]
p arr1
p selection_sort!(arr1)
puts '------'

arr2 = [ 82, 64, 24, 8, 3, 1 ]
p arr2
p selection_sort!(arr2)
puts '------'

empty_arr = []
p empty_arr
p selection_sort!(empty_arr)
puts "------"

arr3 = [3]
p arr3
p selection_sort!(arr3)
puts "----"

arr4 = [ 3, 1 ]
p arr4
p selection_sort!(arr4)
puts "----"
puts