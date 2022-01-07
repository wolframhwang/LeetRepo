

class Solution {
    func pushDominoes(_ dominoes: String) -> String {
        var dom: [Character] = []
        for c in dominoes { dom.append(c) }
        
        var N = dom.count
        var dp : [Int] = [Int](repeating: 0, count: N)
        var point = 0
        let range = 0..<N
        for i in  range{
            if dom[i] == "R" { point = N }
            else if dom[i] == "L" { point = 0 }
            else{ point = max(point - 1, 0)}
            dp[i] += point
        }
        
        point = 0
        for i in range.reversed() {
            if dom[i] == "L" { point = N }
            else if dom[i] == "R" { point = 0 }
            else { point = max(point - 1, 0 )}
            dp[i] -= point
        }
        var answer = ""
        for v in dp {
            if v > 0 {
                answer += "R"
            }
            else if v < 0 {
                answer += "L"
            }else {
                answer += "."
            }
        }
        return answer
    }
}
