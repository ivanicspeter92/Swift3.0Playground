
func insertionSort(array: [Int]) -> [Int] {
    var result = array
    for j in 1 ..< array.count {
        let key = array[j]
        var i = j - 1;
        
        while i >= 0 && result[i] > key {
            result[i + 1] = result[i]
            i -= 1;
        }
        result[i + 1] = key
    }
    
    return result
}

assert(insertionSort(array: [5, 2, 4, 6, 1, 3]) == [1,2,3,4,5,6], "array sorting failed")
assert(insertionSort(array: [31, 41, 59, 26, 41, 58]) == [26, 31, 41, 41, 58, 59], "array sorting failed")