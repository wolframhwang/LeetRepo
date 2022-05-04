class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var dp: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: p.count + 1), count: s.count + 1)
        dp[s.count][p.count] = true
        
        for i in (0...s.count).reversed() {
            for j in (0..<p.count).reversed() {
                let match = (i < s.count && (p[p.index(p.startIndex, offsetBy: j)] == s[s.index(s.startIndex, offsetBy: i)] || p[p.index(p.startIndex, offsetBy: j)] == "."))
                if j + 1 < p.count && p[p.index(p.startIndex, offsetBy: j + 1)] == "*" {
                    dp[i][j] = dp[i][j + 2] || match && dp[i + 1][j]
                } else {
                    dp[i][j] = match && dp[i + 1][j + 1]
                }
            }
        }
        return dp[0][0]
    }
}