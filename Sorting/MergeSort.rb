require 'benchmark'
input_array = Array.new(100){rand(1...100)} 
#print (input_array)

def devide_and_merge input_array, left, right
    if right > left
        middle =  (left + right - 1) / 2
        devide_and_merge input_array, left,  middle
        devide_and_merge input_array, middle + 1, right
        merge input_array, left, right, middle
    end
end

def merge input_array, left, right, middle
    # create temp array for right and left block
    left_array =  Array.new(middle-left+1)
    right_array = Array.new(right-middle)
    copy_array input_array, left_array, left, middle
    copy_array input_array, right_array, middle+1, right
    left_counter = 0
    right_counter = 0

    # merge 2 block into input_array
    for index in left...right+1
        if left_counter >= middle-left+1
            input_array[index] = right_array[right_counter]
            right_counter += 1
        elsif right_counter >= right-middle
            input_array[index] = left_array[left_counter]
            left_counter += 1
        elsif left_array[left_counter] < right_array[right_counter]
            input_array[index] = left_array[left_counter]
            left_counter += 1
        else 
            input_array[index] = right_array[right_counter]
            right_counter += 1
        end
    end
end

def merge_sort input_array
    devide_and_merge input_array, 0, input_array.length-1
    #print input_array
end

def copy_array input_array, copied_array, start_index, end_index
    count = 0
    for index in start_index...end_index+1
        copied_array[count] = input_array[index]
        count +=1
    end
end

time = Benchmark.measure {
    merge_sort input_array
   }
   puts time.real