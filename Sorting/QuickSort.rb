require 'benchmark'
input_array = Array.new(10){rand(1...100)} 
#print (input_array)

def quick_sort input_array
    sorting input_array, 0, input_array.length-1
    print input_array
end

def sorting input_array, low, high
    if high > low
        pivot_index = partition input_array, low, high
        # sorting low partition
        sorting input_array, low, pivot_index-1
        # sorting high partition
        sorting input_array, pivot_index+1, high
    end
        
end

def partition input_array, low, high
    pivot_index = low-1
    pivot_value = input_array[high]
    for index in low...high+1
        if input_array[index] < pivot_value
            pivot_index += 1
            swap input_array, pivot_index, index      
        end
    end
    pivot_index += 1
    swap input_array, pivot_index, high
    return pivot_index
end

def swap input_array, index1, index2
    temp = input_array[index1]
    input_array[index1] = input_array[index2]
    input_array[index2] = temp
end 

time = Benchmark.measure {
    quick_sort input_array
   }
   puts time.real