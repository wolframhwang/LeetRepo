class Solution {
    
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        // Topology Sort
        var refCnt = [Int](repeating: 0, count: numCourses)
        var result = [Int](repeating: 0, count: numCourses)
        var adjcent: [[Int]] = [[Int]](repeating: [], count: numCourses)
        var q: [Int] = []
        var front = 0
        var ret = 0
        
        for i in 0..<prerequisites.count {
            adjcent[prerequisites[i][1]].append(prerequisites[i][0])
            refCnt[prerequisites[i][0]] += 1
        }
        
        for i in 0..<numCourses {
            if refCnt[i] == 0 { q.append(i) }
        }
        
        while q.count != front {
            let now = q[front]
            front += 1
            
            result[ret] = now
            ret += 1
            
            for next in adjcent[now] {
                refCnt[next] -= 1
                if refCnt[next] == 0 {
                    q.append(next)
                }
            }
        }
        
        if ret != numCourses { return [] }
                
        return result
    }
}