class Solution {
    var nums : [Int] = []
    func binarySearch(_ s: Int, _ e: Int, _ target: Int) -> Bool {
        var s = s, e = e
        
        while s < e {
            let m = (s + e) / 2
            if nums[m] == target { return true }
            
            if nums[m] < target {
                s = m + 1
            } else {
                e = m
            }
        }
        return false
    }
    
    func search(_ nums: [Int], _ target: Int) -> Bool {
        self.nums = nums
        
        var index = -1
        for i in 1..<nums.count {
            if nums[i] < nums[i - 1] {
                index = i
                break
            }
        }
        
        if index == -1 {
            return binarySearch(0, nums.count, target)
        }
        else { 
            return binarySearch(0, index, target) || binarySearch(index, nums.count, target) 
        }
    }
}