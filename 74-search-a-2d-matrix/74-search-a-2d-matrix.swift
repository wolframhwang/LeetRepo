class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let N = matrix[0].count
        
        var s = 0, e = 0
        for i in 0..<matrix.count {
            s = 0; e = N
            
            while s < e {
                let m = (s + e)  / 2
                if matrix[i][m] == target { return true }
                if matrix[i][m] < target {
                    s = m + 1
                } else {
                    e = m
                }
            }                        
        }
        return false        
    }
}