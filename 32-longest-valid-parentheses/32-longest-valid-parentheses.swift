class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        if s == "" { return 0 }
        let dpRange = 1..<s.count
        let ss: [Character] = Array(s)
        
        var answer = 0
        var dp: [Int] = [Int](repeating: 0, count: s.count)
        for i in dpRange {
            if ss[i] == ")" {
                if ss[i - 1] == "(" {
                    dp[i] = (i >= 2 ? dp[i - 2] : 0 ) + 2
                } else if i - dp[i - 1] > 0, ss[i - dp[i - 1] - 1] == "(" {
                    dp[i] = dp[i - 1] + ((i - dp[i - 1]) >= 2 ? dp[i - dp[i - 1] - 2] : 0) + 2
                }
                answer = max(answer, dp[i])
            }
        }
        return answer
    }
}