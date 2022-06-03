
class NumMatrix {

    var prefixSum: [[Int]] = []
    init(_ matrix: [[Int]]) {
        prefixSum = matrix
        for i in 0..<prefixSum.count {
            for j in 1..<prefixSum[i].count {
                prefixSum[i][j] += prefixSum[i][j - 1]
            }
        }
        
        for i in 0..<prefixSum[0].count {
            for j in 1..<prefixSum.count {
                prefixSum[j][i] += prefixSum[j - 1][i]
            }
            
        }

    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        var ret = prefixSum[row2][col2] -
                    (col1 > 0 ? prefixSum[row2][col1 - 1] : 0) -
                    (row1 > 0 ? prefixSum[row1 - 1][col2] : 0) +
                    (row1 > 0 && col1 > 0 ? prefixSum[row1 - 1][col1 - 1] : 0)                
        return ret
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */
