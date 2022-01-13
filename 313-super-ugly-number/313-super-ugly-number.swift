class Solution {
    func nthSuperUglyNumber(_ n: Int, _ primes: [Int]) -> Int {
        if n == 1 { return 1 }
        let len = primes.count
        var ptr = [Int](repeating: 1, count: len)
        var dp = [Int](repeating: 0, count: n + 1)
        dp[1] = 1
        for i in 2...n {
            var MIN = Int.max
            for j in 0..<len {
                MIN = min(MIN, primes[j] * dp[ptr[j]])
            }
            dp[i] = MIN
            for j in 0..<len {
                if primes[j] * dp[ptr[j]] == MIN { ptr[j] += 1}
            }
        }
        return dp[n]
    }
}
