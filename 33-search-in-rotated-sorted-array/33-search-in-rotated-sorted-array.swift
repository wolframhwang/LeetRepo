let fail = -1
class Solution {
    var nums: [Int] = []
    func binary(_ l: Int, _ r: Int, _ target: Int) -> Int? {
        var l = l, r = r
        while l < r {
            let m = (l + r) / 2
            if nums[m] == target {
                return m
            }
            else if nums[m] > target {
                r = m
            } else {
                l = m + 1
            }
        }
        return nil
    }
    func search(_ nums: [Int], _ target: Int) -> Int {
        // Todo: 2 번 탐색 해야함
        let size = nums.count
        if size == 0 { return fail }
        if size == 1 { return nums[0] == target ? 0 : fail}
        self.nums = nums
        var answer = -1
        var s = 0, e = size - 1
        while s < e {
            let m = (s + e) / 2
            let v = nums[0] + nums[e]
            let b = nums[0] + nums[m]
            if b < v {
                e = m
            } else {
                s = m + 1
            }
        }
        
        //
        if let result = binary(0, e, target) { return result }
        if let result = binary(e, size, target) { return result }
        
        return answer
    }
}
