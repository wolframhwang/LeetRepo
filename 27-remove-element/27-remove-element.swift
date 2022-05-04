class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count == 1 { return nums[0] == val ? 0: 1}
        var index = 0
        var lastIndex = nums.count - 1
        while index <= lastIndex, nums[index] != -1 {
            if nums[index] == val {
                while lastIndex >= 0, (nums[lastIndex] == val || nums[lastIndex] == -1) {
                    nums[lastIndex] = -1
                    lastIndex -= 1
                }
                if lastIndex < index { break }
                nums.swapAt(index, lastIndex)
                nums[lastIndex] = -1
            }
            index += 1
        }
        while !nums.isEmpty, nums.last! == -1 {
            //print("HOCK")
            nums.popLast()!
        }
        
        return index
    }
}