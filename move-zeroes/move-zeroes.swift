class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var last = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums[last] = nums[i]
                last += 1
            }
        }
        for i in last..<nums.count {
            nums[i] = 0
        }
        
    }
}
