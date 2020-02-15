require 'benchmark'
input_array = Array.new(100){rand(1...100)} 
#print (input_array)

def sellection_sort(input_array)
    for i in 0...input_array.length-1
        j=i
        while j>0
            if input_array[j-1]>input_array[j]
                temp = input_array[j]
                input_array[j] = input_array[i]
                input_array[i] = temp
            end
            j=j-1
        end
    end
   #print (input_array)
end

time = Benchmark.measure {
    sellection_sort(input_array)
   }
   puts time.real
