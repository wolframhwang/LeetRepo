class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var answer: [[Int]] = []
        
        var intervals = (intervals + [newInterval]).sorted {
            if $0[0] < $1[0] { return true }
            if $0[0] == $1[1] { return $0[1] < $1[1] }
            return false
        }
        
        
        for interval in intervals {
            if answer.isEmpty {
                answer.append(interval)
                continue
            }
            let index = answer.count - 1
            let s = answer[index][0]
            let e = answer[index][1]
            
            if s <= interval[0], e >= interval[0] {
                if e < interval[1] {
                    answer[index][1] = interval[1]
                }
                continue
            }
            
            answer.append(interval)
        }
        
        return answer
    }
}