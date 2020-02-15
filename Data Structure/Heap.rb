class Heap
    attr_accessor :size, :heap

    def initialize(input_array)
        @heap = []
        @size = 0
        for index in 0...input_array.length-1
            add input_array[index],index
        end
    end
    
    def add input,index
        @heap[@size] = input
        balance_up size
        @size += 1
    end

    def balance_down index

        # check right
        if is_node?(right_index(index))  
            if ((@heap[index]>@heap[right_index(index)]) and (not is_node(left_index(index)) or @heap[right_index(index)] < @heap[left_index(index)].to_i))
                swap index,right_index(index)
                balance_up right_index(index)
            end
        # check left
        elsif is_node?(left_index(index))  
            if @heap[index]>@heap[left_index(index)]
                swap index,left_index(index)
                balance_up left_index(index)
            end
        end
    end

    def balance_up index
        if index ==0
            balance_down index    
        end
        parrent_node_index=parrent_index index
        if is_node? parrent_node_index
            if  @heap[parrent_node_index] > @heap[index]
                swap parrent_node_index,index
                balance_up parrent_node_index
            else
                return
            end
        end
    end

    def is_node? index
        return (index <= @size and index >=0)
    end

    def right_index index
        return 2*index+2
    end

    def left_index index
        return 2*index+1
    end

    def parrent_index index
        ((index - 1) / 2).floor
    end

    def swap parrent_node_index,index
        temp = @heap[parrent_node_index]
        @heap[parrent_node_index] = @heap[index]
        @heap[index] = temp
    end

end

input_array = Array.new(16){rand(1...100)} 
heap= Heap.new(input_array)
print heap.heap