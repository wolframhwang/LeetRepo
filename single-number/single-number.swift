class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var answer = 0
        var Single: [Int: Bool] = [:]
        for i in nums {
            if Single[i] == nil {
                answer = i
                Single[i] = false
            }else {
                Single[i] = true
            }            
        }
        for (key, value) in Single {
            if value == false { answer = key }
        }
        return answer
    }
}