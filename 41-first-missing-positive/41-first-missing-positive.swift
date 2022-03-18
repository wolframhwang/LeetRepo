
class Solution {
    func firstMissingPositive(_ source: [Int]) -> Int {
        let N = source.count
        
        var nums = source
        var index = 0
        while index < N {
            if index > 0, index < N, nums[index] < N, nums[index] > 0, nums[index] != index + 1, nums[nums[index] - 1] != nums[index] {
                nums.swapAt(index, nums[index] - 1)
            } else {
                index += 1
            }
        }
        
        for i in 0..<N {
            if nums[i] - 1 != i {
                return i + 1
            }
        }
        return N + 1
        
    }
}
