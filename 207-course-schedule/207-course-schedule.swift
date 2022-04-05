class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        guard prerequisites.count > 0 else { return true }
        
        var graph = [Int:[Int]](), inDegrees = [Int:Int](), removedEdges = 0
        
        for p in prerequisites {
            graph[p[1], default:[]].append(p[0])
            inDegrees[p[0], default:0] += 1
        }
        
        var bfsQueue = Array(0..<numCourses).filter { (inDegrees[$0] ?? 0) == 0 }
        
        while !bfsQueue.isEmpty {
            guard let outNodes = graph[bfsQueue.removeFirst()] else { continue }
            removedEdges += outNodes.count
            outNodes.filter { inDegrees[$0] != nil }.forEach {
                inDegrees[$0]! -= 1
                if inDegrees[$0] == 0 {
                    bfsQueue.append($0)
                }
            }
        }
        return removedEdges == prerequisites.count
    }
}