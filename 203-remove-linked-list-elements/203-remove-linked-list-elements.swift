/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var startNode = ListNode(0, head)
        
        var node: ListNode? = startNode
        
        while true {
            if node == nil { break }
            if node?.next == nil { break }
            if node?.next?.val == val {
                node?.next = node?.next?.next ?? nil
            }else {
                node = node?.next
            }
        }
        
        return startNode.next
    }
}
