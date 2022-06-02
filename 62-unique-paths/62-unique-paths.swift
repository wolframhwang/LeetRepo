class Solution {
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 110), count: 110)
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if dp[m][n] != 0 {
            return dp[m][n]
        }
        if m == 1 || n == 1 {
            dp[m][n] = 1
            return dp[m][n]
        }
        dp[m][n] = uniquePaths(m - 1, n) + uniquePaths(m, n - 1)
        return dp[m][n]
    }
}