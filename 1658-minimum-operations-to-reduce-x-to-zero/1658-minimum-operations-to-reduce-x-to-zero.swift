class Solution {
    let INF = 0x7fffffff
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        var answer = INF
        var left = 0
        var sum = 0
        for n in nums {
            sum += n
        }
        
        for right in 0..<nums.count {
            sum -= nums[right]
            while sum < x, left <= right {
                sum += nums[left]
                left += 1
            }
            if sum == x {
                answer = min(answer, left - right + nums.count - 1)
            }
        }
        return answer == INF ? -1: answer
        
    }
}
