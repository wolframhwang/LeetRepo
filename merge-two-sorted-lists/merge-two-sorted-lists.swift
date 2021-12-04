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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil { return list2 }
        if list2 == nil { return list1 }
        var root : ListNode? = nil
        var node1 = list1
        var node2 = list2
        if list1?.val ?? 0 <= list2?.val ?? 0 {
            root = node1
            node1 = node1?.next
        }else {
            root = node2
            node2 = node2?.next
        }
        let ret = root
        while node1 != nil, node2 != nil {
            if node1?.val ?? 0 <= node2?.val ?? 0 {
                root?.next = node1
                node1 = node1?.next
            }else {
                root?.next = node2
                node2 = node2?.next
            }
            root = root?.next
        }
        if node1 != nil {
            root?.next = node1
        }
        if node2 != nil {
            root?.next = node2
        }
        
        return ret
        
    }
}
