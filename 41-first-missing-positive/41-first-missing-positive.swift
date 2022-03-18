class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let maxNum = nums.count + 1
        var nums = nums
        var result = 1
        for index in 0..<nums.count {
            if nums[index] == result {
                result += 1
            }

            if nums[index] <= 0 || nums[index] > nums.count {
                nums[index] = 1
            }
        }

        if result == 1 || result == maxNum {
            return result
        }

        var isLastIndexExists = false
        for index in 0..<nums.count {
            let num = abs(nums[index])

            if num > nums.count - 1 {
                isLastIndexExists = true
            } else {
                nums[num] = -abs(nums[num])
            }
        }

        for index in result..<nums.count {
            if nums[index] > 0 {
                return index
            }
        }

        if !isLastIndexExists {
            return nums.count
        }
    
        return maxNum
    }
}
