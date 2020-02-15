require 'benchmark'
input_array = Array.new(100){rand(1...100)} 
#print (input_array)

def insertion_sort(input_array)
    for i in 0...input_array.length-2
        for j in i.downto(0)
            if input_array[j+1] < input_array[j]
                temp = input_array[j]
                input_array[j] = input_array[j+1]
                input_array[j+1] = temp
            else
                break
            end
        end
    end
    #print (input_array)
end



time = Benchmark.measure {
    insertion_sort(input_array)
   }
   puts time.real
