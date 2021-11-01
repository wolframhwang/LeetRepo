class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var ans = [[String]]()
        var dict : [String: [String]] = [:]
        for str in strs {
            let s = String(str.sorted())
            if let v = dict[s] {
                dict[s]?.append(str)
            }else {
                dict[s] = [str]
            }
        }
        for v in dict.values {
            ans.append(v)
        }
        return ans
    }
}