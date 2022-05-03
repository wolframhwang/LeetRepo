class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        //print(nums)
        var stack: [Int] = []
        var stack2: [Int] = []
        var l = nums.count, r = 0
        for i in 0..<nums.count {
            while (!stack.isEmpty && nums[stack.last!] > nums[i]) {
                l = min(l, stack.popLast()!)
            }
            stack.append(i)
        }
        
        for i in (0..<nums.count).reversed() {
            while !stack2.isEmpty, nums[stack2.last!] < nums[i] {
                r = max(r, stack2.popLast()!)
            }
            stack2.append(i)
        }
        return r - l > 0 ? r - l + 1: 0
    }
}