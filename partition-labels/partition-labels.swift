class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        var ans : [Int] = []
        var arr: [Int] = [Int](repeating: 0, count: s.count)
        var map : [Character: Int] = [:]
        var carr: [Character] = []
        for c in s {
            carr.append(c)
        }
        for i in stride(from: s.count - 1, to: -1, by: -1){
            if map[carr[i]] == nil {
                map[carr[i]] = i
                arr[i] = i
            }else{
                arr[i] = map[carr[i]]!
            }
        }
        
        var MX = arr[0]
        var sp = 0
        for i in 0..<arr.count {
            if i == MX {
                ans.append(MX - sp + 1)
                if i + 1 < arr.count{
                    MX = arr[i + 1]
                }
                sp = i + 1
                continue
            }
            if MX < arr[i] {
                MX = arr[i]
            }
        }
        return ans
    }
}