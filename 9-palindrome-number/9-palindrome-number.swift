class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        var xx = x
        var ret = 0
        
        while xx > 0 {
            ret *= 10
            ret += (xx % 10)
            xx /= 10
        }

        return ret == x
    }
}
