

class Solution {
    var count = 0
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil { return true }
        
        var fastHead = head
        var slowHead = head
        var compare = head
        var now: ListNode? = nil
        
        while fastHead != nil {
            fastHead = fastHead?.next?.next
            slowHead = slowHead?.next
        }
        
        var node: ListNode?
        now = slowHead
        while now != nil {
            let next = now?.next
            now?.next = node
            node = now
            now = next
        }
        
        while compare != nil, node != nil {
            if compare!.val != node!.val {
                return false
            }
            node = node?.next
            compare = compare?.next
        }
        return true
    }
}
