
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

let test = [5, 2, 4, 6, 1, 3];
assert(insertionSort(array: test) == [1,2,3,4,5,6])
assert(insertionSort(array: test) == [1,2,3,4,5,6], "array sorting failed")