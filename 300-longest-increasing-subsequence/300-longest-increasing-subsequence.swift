class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
		if nums.count == 0 {
            return 0
        }
        
        var dp = [Int](repeatElement(0, count: nums.count))
        var length = 0
        
        for num in nums {
            var i = 0
            var j = length
            var m = 0
            while i != j {
                m = (i + j) / 2
                if dp[m] < num {
                    i = m + 1
                } else {
                    j = m
                }
            }
            dp[i] = num
            length = max(i + 1, length)
        }
        
        return length
    }
}
/*
0 0 0 0
*/