
class Solution {
    var total = 0
    var target = 0
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let startNode: ListNode? = ListNode(0, head)
        let ret = startNode
        target = n
        recur(startNode, 0)
        
        return ret?.next
    }
    
    func recur(_ node: ListNode?, _ cnt: Int) {
        if node?.next != nil {
            total += 1
            recur(node?.next, cnt + 1)
        }
        //print(total - cnt, total, cnt)
        if total - cnt == target {
            node?.next = node?.next?.next
        }
    }
}
