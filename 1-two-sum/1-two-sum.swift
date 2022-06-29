class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:]
        
        for i in 0..<nums.count {
            let complement = target - nums[i]
            if map[complement] != nil {
                return [map[complement, default: 0], i]
            }
            map[nums[i]] = i
        }
        
        return []
    }
}