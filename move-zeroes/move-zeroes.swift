class Solution {
    func swap(_ a: Int, _ b: Int, _ nums: inout [Int]) {
        let t = nums[a]
        nums[a] = nums[b]
        nums[b] = t
    }
    
    func moveZeroes(_ nums: inout [Int]) {
        if nums.count <= 1 {
            return
        }
        var last = nums.count - 1
        for i in stride(from: nums.count - 1, to: -1, by: -1){
            if nums[i] == 0, i < last {
                for j in (i + 1)...last {
                    swap(j, j - 1, &nums)
                }
                last -= 1
            }
        }
        
    }
}
