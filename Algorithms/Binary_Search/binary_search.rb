# ======
# Time Complexity: O(logN)
# Space Complexity: O(1)
# ======

def binary_search(array, value)
    
    # First, we establish the lower and upper bounds of where the value we are
    # searching for can be. At the beginning, the lower bound is the first value
    # of the array and the upper bound is the last value of the array.
    lower_bound = 0
    upper_bound = array.length - 1

    # Now we start searching for the value inside the array between the lower and upper bounds.
    # In each iteration of the loop, we check the middle value between the lower and upper bounds
    # against the value we are searching for. If the middle value matches the value we are searching
    # for then we stop, otherwise we update the lower and upper bounds of our search accordingly(Should
    # we search to the right or the left of the mid point in the next iteration to find the value we are
    # looking for).
    #
    # If the value at the mid point matches with the value we are looking for, we are done and we return
    # the mid point(index of the value we are looking for).
    #
    # If the value is lower than the value at the mid point, we should to search to the left side of the mid point
    # in the next iteration. So we set the upper bound to the left of mid point.
    #
    # If the value is higher than the value at the mid point, we should to search to the right side of the mid point
    # in the next iteration. So we set the lower bound to the right of mid point.

    while lower_bound <= upper_bound

        # Find the mid point between the upper and lower bounds
        mid_point = (lower_bound + upper_bound) / 2

        # Look up the value at the mid point
        value_at_mid_point = array[mid_point]

        # Check the value at the mid point against the value we are looking for:

        if value == value_at_mid_point
            return mid_point
        elsif value < value_at_mid_point
            upper_bound = mid_point - 1
        elsif value > value_at_mid_point
            lower_bound = mid_point + 1
        end
    end

    # If the value is not found, return nil indicating the value we are searching for
    # doesn't exist inside the array.
    return nil
end



# Test Cases:
p binary_search( [1,2,3], 3 ) #=> 2
p binary_search( [1,2,3,4,5,6], 1 ) #=> 0
p binary_search( [1,20,45,47,100], 3 ) #=> nil
p binary_search( [1,2,3,4,5,6,7,8,9,10,11,12,13,14,14,15,16,17,18,19,20], 14 ) #=> 13
p binary_search( [1,2,3,4,5,6,7,8,9,10,11,12,13,14,14,15,16,17,18,50,999], 999 ) #=> 20