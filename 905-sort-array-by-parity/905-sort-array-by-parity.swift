class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var odd: [Int] = []
        var even: [Int] = []
        for n in nums {
            if n % 2 == 0 {
                even.append(n)
            } else {
                odd.append(n)
            }
        }
        return even + odd
    }
}
