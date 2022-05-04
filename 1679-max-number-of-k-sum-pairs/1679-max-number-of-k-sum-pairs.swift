class Solution {
    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums.sorted { $0 < $1 }
        var l = 0, r = nums.count - 1
        var answer = 0
        
        while l < r {
            let sum = nums[l] + nums[r]
            if sum == k {
                answer += 1
                l += 1
                r -= 1
            } else if sum < k {
                l += 1
            } else {
                r -= 1
            }
        }
        return answer
    }
}