class Node
    attr_accessor :nxt, :val, :prev, :key
    def initialize(key = nil, val = nil, prev = nil, nxt = nil)
        @val = val
        @nxt = nxt
        @prev = prev
        @key = key
    end
end

class LinkedList
    attr_accessor :head
    def initialize(head = nil)
        @head = head
    end

    def empty?
        @head == nil
    end

    def insert(k, v)
        if empty?
            @head = Node.new(k, v)
        else
            node = @head
            while !@head.nxt.nil?
                node = node.nxt
            end
            node.nxt = Node.new(k, v, node, nil)
        end
    end

    def each(&block)
        if empty?
            nil
        else
            block.call(head)
            crr = head
            while !crr.nxt.nil?
                crr = crr.nxt
                block.call(crr)
            end
        end
    end
end

class HashMap
    attr_accessor :num_buckets, :size, :buckets
    def initialize(items = [])
        @num_buckets = 1
        @buckets = Array.new(@num_buckets){LinkedList.new}
        @size = 0

        items.each do|item|
            k, v = item
            insert(k, v)
        end
    end

    def insert(k, v)
        if @size == @num_buckets
            resize
            insert(k, v)
        else
            @size += 1
            @buckets[k.hash % @num_buckets].insert(k, v)
        end
    end

    def resize
        @num_buckets *= 2
        new_buckets = Array.new(num_buckets){LinkedList.new}
        @buckets.each do |bucket|
            bucket.each do |list|
                new_index = list.key.hash % @num_buckets
                new_buckets[new_index].insert(list.key, list.val)
            end
        end
        @buckets = new_buckets
    end

    def print
        @buckets.each_with_index do |bucket, index|
            p "hash idx:" + index.to_s
            bucket.each do |list|
                p "list key:" + list.key.to_s + " val:" + list.val.to_s
            end
        end
        p "=========end============="
    end

    def get(key)
        index = key.hash % @num_buckets
        res = nil
        @buckets[index].each do |list|
            if list.key == key
                res = list.val
            end
        end
        res
    end
end




#test
items = [[0,0], [1,1], [2, 2], [3,3]]
hash = HashMap.new(items)
p hash.get(3)