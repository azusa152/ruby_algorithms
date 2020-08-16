class Node
    attr_accessor :is_word
    attr_reader :val, :next

    def initialize(val)
        @val = val
        @is_word = false
        @next = []
    end

    def find_next (node,val)
        node.next.each do |n|
            return n if n.val == val
        end
        nil
    end
    
end


class Trie
    attr_accessor :root
    def initialize
        @root = Node.new("*")
    end

    def insert(val)
        node = @root
        val.each_char.with_index do |c,index|
            finded = node.find_next(node,c)
            if !finded.nil?
                node = finded
            else
                n = Node.new(c)
                node.next << n
                node = n
            end

            if index == val.size-1
                node.is_word = true
            end
        end
    end

    def search(val)
        node = @root
        val.each_char.with_index do |c,index|
            finded = node.find_next(node,c)
            if finded.nil?
                return false
            else
                node = finded
            end

            if index == val.size-1 && node.is_word == false
                return false
            end
        end
        true
    end

    def startsWith(val)
        node = @root
        val.each_char.with_index do |c,index|
            finded = node.find_next(node,c)
            if finded.nil?
                return false
            else
                node = finded
            end
        end
        true
    end
end




trie = Trie.new()
trie.insert("ab")
trie.insert("ac")
trie.insert("bc")
trie.search("acc")
p trie
