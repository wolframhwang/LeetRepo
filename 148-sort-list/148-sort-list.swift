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
    func merge(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var list1 = list1
        var list2 = list2

        let dummyHead: ListNode? = ListNode(0)
        var ptr: ListNode? = dummyHead

        while list1 != nil, list2 != nil {
            if (list1?.val ?? 0) < (list2?.val ?? 0) {
                ptr?.next = list1
                list1 = list1?.next
            } else {
                ptr?.next = list2
                list2 = list2?.next
            }
            ptr = ptr?.next
        }
        if list1 != nil { ptr?.next = list1 }
        else { ptr?.next = list2 }

        return dummyHead?.next;
    }

    func getMid(_ head: ListNode?) -> ListNode? {
        var head = head
        var midPrev: ListNode? = nil
        while head != nil, head?.next != nil {
            midPrev = (midPrev == nil) ? head: midPrev?.next
            head = head?.next?.next
        }
        
        var mid: ListNode? = midPrev?.next
        midPrev?.next = nil

        return mid;
    }

    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }

        var mid: ListNode? = getMid(head)
        var left: ListNode? = sortList(head)
        var right: ListNode? = sortList(mid)
        return merge(left, right)
    }
}