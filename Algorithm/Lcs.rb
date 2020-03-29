input1="abcdaf"
input2="acbcf"

def find_max(value1, value2)
    value1>value2 ? value1 : value2
end

def lcs(input1, input2)
    matrix = []
    subarray = Array.new(input2.length+1,0)
    matrix.push(subarray)

    input1.each_char.with_index(1) do |value1, index1|
        subarray = []
        subarray.push(0)
        input2.each_char.with_index(1) do |value2, index2|
            subarray.push(value1 == value2 ? matrix[index1-1][index2-1]+1 : find_max(matrix[index1-1][index2], subarray[index2-1]))
        end
        matrix.push(subarray)
    end
    print matrix[input1.length][input2.length]
end

lcs(input1,input2)