class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var t1: [Character] = Array(text1)
        var t2: [Character] = Array(text2)
        
        var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: text2.count + 1), count: text1.count + 1)
        
        for i in (0..<text2.count).reversed() {
            for j in (0..<text1.count).reversed() {
                if t1[j] == t2[i] {
                    dp[j][i] = dp[j + 1][i + 1] + 1
                } else {
                    dp[j][i] = max(dp[j + 1][i], dp[j][i + 1])
                }
            }
        }
        
        return dp[0][0]
    }
}