require_relative '../Data Structure/Heap.rb'
require 'benchmark'
input_array = Array.new(100){rand(1...100)} 

def heap_sort input_array
    heap= Heap.new(input_array)
    output_array = []
    while heap.size!=0
        output_array.push heap.peak
        heap.pop
    end
    #print output_array
end


time = Benchmark.measure {
    heap_sort input_array
   }
   puts time.real