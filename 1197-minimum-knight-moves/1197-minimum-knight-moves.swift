class Solution {
    var map: [String: Int] = [:]
    func dfs(_ x: Int, _ y: Int) -> Int {
        let key = "\(x),\(y)"
        if map[key] != nil {
            return map[key, default: 0]
        }
        
        if x + y == 0 {
            return 0
        }
        else if x + y == 2 {
            return 2
        }
        else {
            let ret = min(dfs(abs(x - 1), abs(y - 2)), dfs(abs(x - 2), abs(y - 1))) + 1
            map[key] = ret
            return ret
        }
    }
    func minKnightMoves(_ x: Int, _ y: Int) -> Int {
        return dfs(abs(x), abs(y))
    }
}
