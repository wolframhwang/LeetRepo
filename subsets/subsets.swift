class Solution {
    var answer : [[Int]] = []
    var num = [Int]()
    var arr = [Int]()
    
    func recur(_ index: Int) {
        if index == num.count {
            answer.append(arr)
            return
        }
        recur(index + 1)
        
        arr.append(num[index])
        recur(index + 1)
        arr.popLast()
    }
    func subsets(_ nums: [Int]) -> [[Int]] {
        num = nums
        recur(0)
        return answer
    }
}
