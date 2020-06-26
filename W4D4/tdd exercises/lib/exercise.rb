class Array
    def uniq
        hash = {}
        self.each do |ele|
            hash[ele] = true
        end
        hash.keys
    end

    def two_sum
        res = []
        (0...self.length).each do |i|
            (0...self.length).each do |j|
                if j > i
                    res << [i,j] if self[i] + self[j] == 0
                end
            end
        end
        res
    end

    def my_transpose
        arr = Array.new(self.length) {Array.new(self.length)}
        (0...self.length).each do |i|
            (0...self.length).each do |j|
                arr[i][j] = self[j][i]
            end
        end
        arr
    end
    

end

def stock_picker(arr)
    max = 0
    newArr = []
    (0...arr.length).each do |i|
        (0...arr.length).each do |j|
            if j > i && (arr[j] - arr[i]) > max
                max = arr[j] - arr[i]
                newArr << [i,j]
            end
        end
    end
    newArr[-1]
end
