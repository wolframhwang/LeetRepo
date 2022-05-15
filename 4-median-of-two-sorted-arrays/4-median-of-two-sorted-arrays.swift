class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        let m = nums1.count
        let n = nums2.count
        if m == 0 {
            return Double(nums2[n/2] + nums2[(n-1)/2]) / 2.0
        }
        if n == 0 {
            return Double(nums1[m/2] + nums1[(m-1)/2]) / 2.0
        }
        
        var L: [Int] = []
        var S: [Int] = []
        if nums1.count < nums2.count {
            L = nums2
            S = nums1
        } else {
            L = nums1
            S = nums2
        }
        
        var l = L.count
        var s = S.count
        var left = 0, right = s
        
        while left <= right {
            var smid = (left + right) / 2
            var lmid = (l + s + 1) / 2 - smid

            var sl = smid <= 0 ? Int.min : S[smid - 1]
            var sr = smid >= s ? Int.max : S[smid]

            var ll = lmid <= 0 ? Int.min : L[lmid - 1]
            var lr = lmid >= l ? Int.max : L[lmid]

            if sl > lr {
                right = smid - 1
            } else if ll > sr {
                left = smid + 1
            } else {
                if (l+s) % 2 == 1 {
                    return Double(max(sl, ll))
                } else {
                    return Double(min(sr, lr) + max(sl, ll)) / 2.0
                }
            }
        }
        return 0.0
    }
}
