class Solution {
    
    let INF = 987654321
    
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }
        var dp = [Int](repeating: INF, count: amount + 1)
        
        for n in coins {
            if n > amount { continue }
            dp[n] = 1
        }
        
        for i in 1...amount {
            for j in 0..<coins.count {
                let index = i - coins[j]
                if index <= 0 { continue }
                dp[i] = min(dp[i], dp[index] + 1)
            }
        }
        
        return dp[amount] == INF ? -1: dp[amount]
    }
}

