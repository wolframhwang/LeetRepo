
class Solution {
    var orderMap: [Int: Int] = [:]
    var now: Int = 0
    
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        
        now = postorder.count - 1
        orderMap = [:]
        
        for (idx, val) in inorder.enumerated() {
            orderMap[val] = idx
        }
        
        return recur(postorder, 0, postorder.count - 1)
    }
    
    func recur(_ postorder: [Int], _ s: Int, _ e: Int) -> TreeNode? {
        if s > e || now < 0 {
            return nil
        }
        let v = postorder[now]
        let node = TreeNode(v)
        let index = orderMap[v] ?? 0
        
        now -= 1
        
        node.right = recur(postorder, index + 1, e)
        node.left = recur(postorder, s, index - 1)
        
        return node
    }
}
