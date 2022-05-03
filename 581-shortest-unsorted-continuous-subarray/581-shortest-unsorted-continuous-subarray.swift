class Solution {
    let INF = 987654321
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        var startNode = -1
        for i in 1..<nums.count {
            if nums[i] < nums[i - 1] {
                startNode = i - 1
                break
            }
        }
        if startNode == -1 { return 0 }
        var endNode = -1
        for i in (0..<(nums.count - 1)).reversed() {
            if nums[i] > nums[i + 1] {
                endNode = i + 1
                break
            }
        }
        if endNode == -1 { return nums.count }
        
        var maxx = -INF, minn = INF
        for i in startNode...endNode {
            maxx = max(maxx, nums[i])
            minn = min(minn, nums[i])
        }
        
        var s = 0, e = startNode
        var seq = [0, 0]
        while s < e {
            let mid = (s + e) / 2
            if nums[mid] <= minn { s = mid + 1}
            else { e = mid }
        }
        seq[0] = e
        s = endNode; e = nums.count
        while s < e {
            let mid = (s + e) / 2
            if nums[mid] < maxx { s = mid + 1}
            else { e = mid }
        }
        seq[1] = e
        
        return seq[1] - seq[0]
    }
}
