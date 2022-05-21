class Solution {
    var out: [Int] = []
    var visit: [Bool] = []
    var dict: [Int: Bool] = [:]
    var ans: [[Int]] = []
    func makeKey() -> Int {
        var ret = 0
        for n in out {
            ret = (ret << 5) + (n + 10)
        }
        return ret
    }
    func permutation(_ nums: [Int], _ index: Int) {
        if nums.count == index {
            let key = makeKey()
            if dict[key, default: false] == false { 
                ans.append(out)
                dict[key] = true
            }
            return
        }
        for i in 0..<nums.count {
            if visit[i] == true { continue }
            out[index] = nums[i]
            visit[i] = true
            permutation(nums, index + 1)
            visit[i] = false
        }
    }
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        out = [Int](repeating: 0, count: nums.count)
        visit = [Bool](repeating: false, count: nums.count)

        permutation(nums, 0)

        return ans
    }
}