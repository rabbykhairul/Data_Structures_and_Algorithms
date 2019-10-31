# ===========
# Time Complexity:
#   Worst Case: O((N^2 / 2) + (N^2 / 2) + N - 1 + N - 1) ~ O(N^2 + 2N - 2) ~ O(N^2)
#   Best Case: O(N + N - 1 + N - 1) ~ O(3N - 2) ~ O(N)
#   Average Case: O(N^2 / 2)
# Space Complexity: O(1)
# ===========

def insertion_sort!(array)
    (1...array.length).each do |idx1|
        position = idx1
        temp_value = array[idx1]

        while position > 0 && array[position - 1] > temp_value
            array[position] = array[position - 1]
            position -= 1
        end

        array[position] = temp_value
    end

    array
end

# Test Cases:
puts

arr1 = [ 10, 50, 20, 5, 2, 0, 10 ]
p arr1
p insertion_sort!(arr1)
puts '------'

arr2 = [ 82, 64, 24, 8, 3, 1 ]
p arr2
p insertion_sort!(arr2)
puts '------'

empty_arr = []
p empty_arr
p insertion_sort!(empty_arr)
puts "------"

arr3 = [3]
p arr3
p insertion_sort!(arr3)
puts "----"

arr4 = [ 3, 1 ]
p arr4
p insertion_sort!(arr4)
puts "----"
puts