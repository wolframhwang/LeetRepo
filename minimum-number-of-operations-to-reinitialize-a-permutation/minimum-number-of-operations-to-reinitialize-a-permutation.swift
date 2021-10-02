class Solution {
    func reinitializePermutation(_ n: Int) -> Int {
        if n == 2 { return 1}
        var pos = 1
        var now = 2
        var mid = n / 2
        while now != 1 {
            if now < mid {
                now *= 2
            }
            else {
                now = (n - 1) - (n - 1 - now) * 2
            }
            pos += 1
        }
        return pos
    }
}
