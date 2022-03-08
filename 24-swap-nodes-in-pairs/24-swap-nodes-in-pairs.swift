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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var node = head
        guard var nodeNext = head?.next else { return head }
        let ret = nodeNext
        
        var before: ListNode? = nil
        while true {
            let temp = nodeNext.next
            node?.next = temp
            nodeNext.next = node
            if before != nil { before?.next = nodeNext }
            
            if temp == nil { return ret }
            before = node
            node = temp
            if node?.next == nil  { return ret }
            nodeNext = node?.next as! ListNode
        }
        return ret
    }
}
