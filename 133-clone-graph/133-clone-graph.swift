class Solution {
    var visited = [Int: Node]()
    func cloneGraph(_ node: Node?) -> Node? {
        
        guard let node = node else {
            return nil
        }
                        
        var queue = [Node]()
        var front = 0
        queue.append(node)
        
        while queue.count != front {
            let topNode = queue[front]
            front += 1
            
            if visited[topNode.val] == nil {
                visited[topNode.val] = Node(topNode.val)
            }
            for neighbor in topNode.neighbors where neighbor != nil {
                if visited[neighbor!.val] == nil {
                    queue.append(neighbor!)
                    visited[neighbor!.val] = Node(neighbor!.val)
                }
                
               if let topNode = visited[topNode.val], let neighbor = visited[neighbor!.val] {
                   topNode.neighbors.append(neighbor)
                   visited[topNode.val] = topNode
                   visited[neighbor.val] = neighbor
               }
            }
        }
        
        return visited[node.val]
    }
}
