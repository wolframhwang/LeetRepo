/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var heada = headA, headb = headB
        var cntA = 0, cntB = 0
        
        while heada != nil {
            cntA += 1
            heada = heada?.next
        }
        
        while headb != nil {
            cntB += 1
            headb = headb?.next
        }
        
        heada = headA; headb = headB
        
        while cntA > cntB {
            heada = heada?.next
            cntA -= 1
        }
        
        while cntB > cntA {
            headb = headb?.next
            cntB -= 1
        }
        
        while heada != nil {
            if heada === headb {
                return heada
            }
            heada = heada?.next
            headb = headb?.next
        }
        
        return nil
    }
}
