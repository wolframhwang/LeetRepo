class Solution {
    let limitUpper = (1 << 31) - 1
    let limitLower = -(1 << 31)
    func reverse(_ x: Int) -> Int {
        var ret = 0
        var isMinus = x < 0 ? true: false
        var x = isMinus ? -x: x
        while x > 0 {
            ret *= 10
            ret += (x % 10)
            x /= 10
        }
        if ret > limitUpper { ret = 0}
        if ret < limitLower { ret = 0}
        return isMinus ? -ret: ret
    }
}
