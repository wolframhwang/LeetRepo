class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var left = m - 1
        var right = n - 1
        var total = m + n - 1
        while left >= 0, right >= 0 {
            if (nums1[left] < nums2[right]) {
                nums1[total] = nums2[right]
                right -= 1
            }
            else {
                nums1[total] = nums1[left]
                left -= 1
            }
            total -= 1
        }
        
        for i in 0..<(right + 1) {
            nums1[i] = nums2[i]
        }
    }
}
// 3
// 1 2 3 0 0 0
// 2 5 6
