# ===========
# Time Complexity:
#   Worst Case: O(2N) ~ O(N)
#   Best Case: O(N)
#   Average Case: O(N)
# Space Complexity: O(1)
# ===========
class Selector
    def initialize(array)
        @array = array
    end

    def quickselect!(kth_lowest_value, left_index = 0, right_index = @array.length - 1)
        return nil if kth_lowest_value >= @array.length

        return @array[left_index] if left_index >= right_index

        pivot_position = partition!(left_index, right_index)

        if kth_lowest_value == pivot_position
            return @array[pivot_position]
        elsif kth_lowest_value < pivot_position
            quickselect!(kth_lowest_value, left_index, pivot_position - 1)
        elsif kth_lowest_value > pivot_position
            quickselect!(kth_lowest_value, pivot_position + 1, right_index)
        end
    end

    def partition!(left_pointer, right_pointer)
        pivot_position = right_pointer
        pivot = @array[pivot_position]
        right_pointer -= 1

        while true
            while @array[left_pointer] < pivot
                left_pointer += 1
            end

            while @array[right_pointer] > pivot
                right_pointer -= 1
            end

            break if left_pointer >= right_pointer

            @array[left_pointer], @array[right_pointer] = @array[right_pointer], @array[left_pointer]
        end

        @array[left_pointer], @array[pivot_position] = @array[pivot_position], @array[left_pointer]
        left_pointer
    end
end

# Test Case:
selector = Selector.new([0, 50, 20, 10, 60, 30])
p selector.quickselect!(10)