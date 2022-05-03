class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        //print(nums)
        var stack: [Int] = []
        var l = nums.count, r = 0
        for i in 0..<nums.count {
            while (!stack.isEmpty && nums[stack.last!] > nums[i]) {
                l = min(l, stack.popLast()!)
            }
            stack.append(i)
        }
        stack = []
        for i in (0..<nums.count).reversed() {
            while !stack.isEmpty, nums[stack.last!] < nums[i] {
                r = max(r, stack.popLast()!)
            }
            stack.append(i)
        }
        return r - l > 0 ? r - l + 1: 0
    }
}