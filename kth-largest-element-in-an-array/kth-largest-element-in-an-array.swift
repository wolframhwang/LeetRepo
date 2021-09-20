class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let v = nums.sorted { $0 > $1}
        return v[k - 1]
    }
}