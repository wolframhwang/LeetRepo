
class Solution {
    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        var map: [Int: Int] = [:]
        var answer = 0
        
        for i in 0..<nums.count {
            let current = nums[i]
            let compensate = k - current
            if map[compensate, default: 0] > 0 {
                map[compensate] = map[compensate, default: 0] - 1
                answer += 1
            } else {
                map[current] = map[current, default: 0] + 1
            }
        }
        
        
        return answer
    }
}