class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        guard prerequisites.count > 0 else { return true }
        
        var graph = [Int:[Int]](), inDegree = [Int:Int](), removedEdges = 0
        
        for p in prerequisites {
            graph[p[1], default:[]].append(p[0])
            inDegree[p[0], default:0] += 1
        }
        
        var q = Array(0..<numCourses).filter { (inDegree[$0] ?? 0) == 0 }
        
        while !q.isEmpty {
            guard let outNodes = graph[q.removeFirst()] else { continue }
            removedEdges += outNodes.count
            outNodes
                .filter { inDegree[$0] != nil }
                .forEach {
                    inDegree[$0]! -= 1
                    if inDegree[$0] == 0 {
                        q.append($0)
                    }
                }
        }
        return removedEdges == prerequisites.count
    }
}
