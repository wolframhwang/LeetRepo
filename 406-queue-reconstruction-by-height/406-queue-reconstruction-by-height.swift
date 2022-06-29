class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        var res = [[Int]]()
        people.sorted(by: { ($0[0] == $1[0]) ? $0[1] < $1[1] : $0[0] > $1[0] }).forEach({res.insert($0, at: $0[1])})
        return res
    }
}