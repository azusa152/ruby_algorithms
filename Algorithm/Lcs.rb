input1="abcdaf"
input2="acbcf"

class Lcs
    attr_reader :matrix, :lcs_length, :lcs_string
    attr :input1, :input2
    def initialize(input1, input2)
        @input1 = input1
        @input2 = input2

        @matrix = []
        subarray = Array.new(input2.length+1,0)
        @matrix.push(subarray)

        input1.each_char.with_index(1) do |value1, index1|
            subarray = []
            subarray.push(0)
            input2.each_char.with_index(1) do |value2, index2|
                subarray.push(value1 == value2 ? @matrix[index1-1][index2-1]+1 : find_max(@matrix[index1-1][index2], subarray[index2-1]))
            end
            @matrix.push(subarray)
        end
        @lcs_length = matrix[input1.length][input2.length]
        find_lcs_string()

    end

    def find_lcs_string()
        input1.reverse.each_char.with_index(0) do |value1, index1|
            input2.reverse.each_char.with_index(0) do |value2, index2|
                if(matrix.reverse[index1])
    end
end

def find_max(value1, value2)
    value1>value2 ? value1 : value2
end

lcs=Lcs.new(input1,input2)
print(lcs.lcs_length)