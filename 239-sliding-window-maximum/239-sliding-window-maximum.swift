let INF = 987654321

class DequeNode {
    var value: Int
    var left: DequeNode?
    var right: DequeNode?
    
    init(_ value: Int) {
        self.value = value
        left = nil
        right = nil
    }
    init(_ value: Int, _ left: DequeNode?, _ right: DequeNode) {
        self.value = value
        self.left = left
        self.right = right
    }
    func pop() {
        left?.right = right
        right?.left = left
    }
}

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        let range = 0..<n
        let head: DequeNode = DequeNode(INF)
        let tail: DequeNode = DequeNode(INF)
        
        head.right = tail
        tail.left = head
        
        var left = 0, right = k - 1
        
        var result: [Int] = []
        for i in range {
            while head.right !== tail, head.right?.value ?? 0 < (i - (k - 1)) {
                head.right?.pop()
            }
            
            while head.right !== tail, nums[tail.left?.value ?? 0] < nums[i] {
                tail.left?.pop()
            }
            let node: DequeNode? = DequeNode(i, tail.left, tail)
            tail.left?.right = node
            tail.left = node
            if i >= k - 1 { result.append(nums[head.right?.value ?? 0])}
            //(!dq.empty() and dq.front() < i - (k - 1)) dq.pop_front();    // pop elements
        }
        return result
        
    }
}