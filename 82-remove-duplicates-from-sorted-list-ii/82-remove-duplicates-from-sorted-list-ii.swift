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
    let INF = 987654321
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var node: ListNode? = ListNode(INF, head)
        
        let ret = node
        
        var cnt = 0
        
        while node != nil {
            cnt = 0
            
            let now = node?.next
            var nd = node?.next
            
            while nd != nil, (nd?.val)! == (now?.val)! {
                nd = nd?.next
                cnt += 1
            }
            if cnt >= 2 {
                node?.next = nd
                continue
            }
            node = node?.next
        }
            
        return ret?.next
    }
}
