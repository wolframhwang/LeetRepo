class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let n = triangle.count
        let rangeRow = (0..<n).reversed()
        
        var dp = triangle
        
        for i in rangeRow {
            let rangeCol = (0..<triangle[i].count)
            for j in rangeCol {
                if i == (n - 1) { dp[i][j] = triangle[i][j]}
                else { dp[i][j] = triangle[i][j] + min(dp[i + 1][j], dp[i + 1][j + 1])}
            }
        }
        return dp[0][0]
    }
}
