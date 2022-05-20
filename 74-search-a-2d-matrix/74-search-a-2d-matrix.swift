class Solution {
    func binarySearch(_ matrix: inout [Int], _ target: Int) -> Bool {
        var s = 0, e = matrix.count
        while s < e {
            let m = (s + e) / 2
            if matrix[m] == target { return true }
            if matrix[m] < target {
                s = m + 1
            } else {
                e = m
            }
        }
        return false
    }
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var matrix = matrix
        for i in 0..<matrix.count {
            if binarySearch(&matrix[i], target) {
                return true
            }
        }
        return false        
    }
}