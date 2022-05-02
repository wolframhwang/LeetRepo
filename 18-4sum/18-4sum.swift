class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var dummyAns: Set<[Int]> = Set<[Int]>()
        let nums = nums.sorted { $0 < $1 }
        
        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                var l = j + 1
                var r = nums.count - 1
                while l < r {
                    let sum = nums[i] + nums[j] + nums[l] + nums[r]
                    if sum == target {
                        dummyAns.insert([nums[i], nums[j], nums[l], nums[r]])
                        l += 1
                        r -= 1
                    } else if sum > target {
                        r -= 1
                    } else {
                        l += 1
                    }
                }
            }
        }
        return Array(dummyAns)
    }
}
