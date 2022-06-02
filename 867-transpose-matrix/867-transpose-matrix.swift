class Solution {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        if matrix == [] { return [] }
        let m = matrix.count
        let n = matrix[0].count
        var ret: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
        
        for i in 0..<n {
            for j in 0..<m {
                ret[i][j] = matrix[j][i]
            }
        }
        
        return ret
    }
}
