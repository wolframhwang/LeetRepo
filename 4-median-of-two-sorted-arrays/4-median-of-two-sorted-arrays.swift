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
        
        var L = nums1 //larger array
        var S = nums2 //smaller array
        if L.count < S.count { 
            L = nums2
            S = nums1
        }
        
        var l = L.count //L size
        var s = S.count //S size
        var left = 0, right = s
        while left <= right {
            var smid = (left + right)/2 //binary search for desired partition in smaller array
            var lmid = (l+s+1) / 2 - smid //balancing partition in larger array

            var sl = smid <= 0 ? Int.min : S[smid-1] //value left of mid in smaller array
            var sr = smid >= s ? Int.max : S[smid] //value right of mid in smaller array

            var ll = lmid <= 0 ? Int.min : L[lmid-1] //value right of mid in larger array
            var lr = lmid >= l ? Int.max : L[lmid] //value right of mid in larger array

            if sl > lr { //we are too right of solution
                right = smid - 1
            } else if ll > sr { //we are too left of solution
                left = smid + 1
            } else { //we found the solution
                if (l+s) % 2 == 1 {
                    return Double(max(sl, ll))
                } else {
                    return Double(min(sr, lr) + max(sl, ll)) / 2.0 
                }
            }
        }
        return 0.0 // should not reach for a valid input
    }
}