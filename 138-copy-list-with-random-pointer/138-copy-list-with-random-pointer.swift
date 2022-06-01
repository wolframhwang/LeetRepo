/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *    	   self.random = nil
 *     }
 * }
 */

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        if head == nil { return nil }
        //let ret: Node? = Node(head?.val ?? 0)
        var node = head
        var origin: [Node?] = []
        var nodeArray: [Node?] = []
        
        while node != nil {
            guard let value = node?.val else { return node }
            origin.append(node)
            let inp: Node? = Node(value)
            if nodeArray.count > 0 {
                nodeArray[nodeArray.count - 1]?.next = inp
            }
            nodeArray.append(inp)
            node = node?.next
        }
        
        for i in 0..<origin.count {
            let now = origin[i]?.random
            
            for j in 0..<origin.count {
                if now === origin[j] {
                    nodeArray[i]?.random = nodeArray[j]
                    break
                }
            }
        }
        
        
        return nodeArray[0]
    }
}
