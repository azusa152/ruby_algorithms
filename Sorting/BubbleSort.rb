input_array = Array.new(10){rand(1...100)} 
print (input_array)


def bubble_sort(input_array)
    for i in 0...input_array.length-1
        for j in 0...input_array.length-1-i
            if input_array[j] > input_array[j+1]
                input_array[j+1] += input_array[j] 
                input_array[j]  = input_array[j+1] - input_array[j]
                input_array[j+1] -= input_array[j]
            end
        end
    end
    print (input_array)
end

bubble_sort (input_array)