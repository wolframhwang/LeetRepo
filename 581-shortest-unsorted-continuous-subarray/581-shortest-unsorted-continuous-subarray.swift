class Solution {
    var nums: [Int] = []
    let INF = 987654321
    func upperBound(_ s: Int, _ e: Int, _ target: Int) -> Int {
        var s = s, e = e
        
        while s < e {
            let mid = (s + e) / 2
            if nums[mid] <= target { s = mid + 1}
            else { e = mid }
        }
        return e
    }
    func lowerBound(_ s: Int, _ e: Int, _ target: Int) -> Int {
        var s = s, e = e
        
        while s < e {
            let mid = (s + e) / 2
            if nums[mid] < target { s = mid + 1}
            else { e = mid }
        }
        return e
    }
    func findStartNode() -> Int {
        for i in 1..<nums.count {
            if nums[i] < nums[i - 1] {
                return i - 1
            }
        }
        return -1
    }
    func findEndNode() -> Int {
        for i in (0..<(nums.count - 1)).reversed() {
            if nums[i] > nums[i + 1] {
                return i + 1
            }
        }
        return -1
    }
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        //print(nums)
        self.nums = nums
        var startNode = findStartNode()
        if startNode == -1 { return 0 }
        var endNode = findEndNode()
        if endNode == -1 { return nums.count }
        //print(startNode, endNode, nums)
        
        var maxx = -INF, minn = INF
        for i in startNode...endNode {
            maxx = max(maxx, nums[i])
            minn = min(minn, nums[i])
        }
        let s = upperBound(0, startNode, minn)
        let e = lowerBound(endNode, nums.count, maxx)
        
        return e - s
    }
}