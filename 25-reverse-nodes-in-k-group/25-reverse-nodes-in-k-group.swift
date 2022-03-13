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
    private var node: ListNode? = nil
    private var dummy: ListNode? = nil
    
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        return findNode(head, k)
    }
    
    func findNode(_ node: ListNode?, _ k: Int) -> ListNode? {
        var head = node
        
        var nodes = node
        var cnt = 1
        
        while nodes?.next != nil {
            if cnt == k {
                nodes?.next = findNode(nodes?.next, k)
                break
            }
            nodes = nodes?.next
            cnt += 1
        }
        if cnt < k {
            return node
        }
        else {
            recur(head, nil, 0, k)
            head = self.dummy
        }
        return head
    }
    
    func setDest(_ node: ListNode?, _ dumm: ListNode?) {
        self.node = node
        self.dummy = dumm
    }
    func recur(_ node: ListNode?, _ beforeNode: ListNode?, _ cnt: Int, _ k: Int) {
        if cnt == k {
            return
        }
        recur(node?.next, node, cnt + 1, k)
        if cnt + 1 == k { self.setDest(node?.next, node); }
        if cnt == 0 { node?.next = self.node }
        else { node?.next = beforeNode }
    }
}
