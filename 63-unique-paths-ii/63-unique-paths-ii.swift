class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let N = obstacleGrid.count
        let M = obstacleGrid[0].count

        var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: obstacleGrid[0].count), count: obstacleGrid.count)
        
        if obstacleGrid[0][0] == 0 {
            dp[0][0] = 1
        }
        
        for i in 1..<M {
            if obstacleGrid[0][i] == 1 { continue }
            dp[0][i] = dp[0][i - 1]
        }
        
        for i in 1..<N {
            for j in 0..<M {
                if obstacleGrid[i][j] == 1 { continue }
                if i - 1 >= 0, j - 1 >= 0{
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                } else if i - 1 >= 0, j - 1 < 0 {
                    dp[i][j] = dp[i - 1][j]
                }
            }
        }
        
        return dp[N - 1][M - 1]
    }
}