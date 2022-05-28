class Solution {
    var map = Set<Int>()
    func missingNumber(_ nums: [Int]) -> Int {
        for n in nums {
            map.insert(n)
        }
        var ret = 0
        
        while ret < nums.count {
            if !map.contains(ret) {
                return ret
            }
            ret += 1
        }
        
        return ret
    }
}
