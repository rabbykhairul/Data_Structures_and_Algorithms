# ======
# Time Complexity: O(N^2)
# Space Complexity: O(1)
# ======

def bubble_sort(array)
    unsorted_until_index = array.length - 1
    sorted = false

    until sorted
        sorted = true
        
        (0...unsorted_until_index).each do |idx|
            if array[idx] > array[idx + 1]
                sorted = false
                array[idx], array[idx + 1] = array[idx + 1], array[idx]
            end
        end

        unsorted_until_index -= 1
    end

    array
end


# Test Cases:
puts

arr1 = [ 10, 50, 20, 5, 2, 0, 10 ]
p arr1
p bubble_sort(arr1)
puts '------'

arr2 = [ 82, 64, 24, 8, 3, 1 ]
p arr2
p bubble_sort(arr2)
puts '------'

empty_arr = []
p empty_arr
p bubble_sort(empty_arr)
puts "------"

arr3 = [3]
p arr3
p bubble_sort(arr3)
puts "----"

arr4 = [ 3, 1 ]
p arr4
p bubble_sort(arr4)
puts "----"
puts