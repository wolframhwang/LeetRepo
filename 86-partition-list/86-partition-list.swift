

class Solution {
    let INF = 987654321
    
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var node: ListNode? = ListNode(INF, head)
        var q: [ListNode?] = []
        let ret = node

        while node != nil, node?.next != nil {
            if (node?.next?.val)! >= x {
                q.append(node?.next)
                node?.next = node?.next?.next
            } else {
                node = node?.next
            }
        }
        
        for nd in q {
            node?.next = nd
            node = node?.next
        }
        node?.next = nil
        
        return ret?.next
    }
}
