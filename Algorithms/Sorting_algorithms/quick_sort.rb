# =======
# Time Complexity:
#   Worst Case: O(N^2 / 2) ~ O(N^2)
#   Best Case: O(NlogN)
#   Average Case: O(NlogN)
# Space Complexity: O(1)
# =======

class SortArray
    attr_reader :array

    def initialize(array)
        @array = array
    end

    def partition!(left_pointer, right_pointer)
        # Choosing the right most element as the pivot
        pivot_position = right_pointer
        pivot = array[pivot_position]

        # Set the right pointer to the immediate left index of the pivot
        right_pointer -= 1

        while true
            # Move the left pointer to the right side to find an index containing value greater than or equal 
            # to the pivot
            while array[left_pointer] < pivot
                left_pointer += 1
            end

            # Now move the right pointer to the left side to find an index containing value smaller than or equal
            # to the pivot
            while array[right_pointer] > pivot
                right_pointer -= 1
            end

            # If the left pointer passes the right pointer or points to the same index, break the loop to stop
            # partitioning
            if left_pointer >= right_pointer
                break
            else
                # Swap the values pointed by left and right pointers with each others
                @array[left_pointer], @array[right_pointer] = @array[right_pointer], @array[left_pointer]
            end
        end

        # Finally, swap the value pointed by the left pointer with the pivot itself
        @array[left_pointer], @array[pivot_position] = @array[pivot_position], @array[left_pointer]

        # Return the position of the left pointer to indicate the final position of the pivot in the array
        left_pointer
    end

    def quicksort!(left_index = 0, right_index = array.length - 1)
        # Base case
        return if left_index >= right_index

        # Partition the array and get the final position of the pivot after the partition
        pivot_position = partition!(left_index, right_index)
        # Sort the elements smallar than the pivot
        quicksort!(left_index, pivot_position - 1)
        # Sort the elements greater than the pivot
        quicksort!(pivot_position + 1, right_index)
    end
end


# Test Cases:
arr1 = [0, 5, 2, 1, 6, 3]
sorter = SortArray.new(arr1)
sorter.quicksort!
p arr1