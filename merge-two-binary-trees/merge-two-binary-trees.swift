
class Solution {
    func merge(_ node1: TreeNode?, _ node2: TreeNode?) {
        node1?.val += node2?.val ?? 0        
        var left = false
        var right = false
        if node1?.left == nil, node2?.left != nil {
            node1?.left = node2?.left
            left = true
        }
        if node1?.right == nil, node2?.right != nil {
            node1?.right = node2?.right
            right = true
        }
        if node1?.left != nil, node2?.left != nil, !left {
            merge(node1?.left, node2?.left)
        }
        if node1?.right != nil, node2?.right != nil, !right {
            merge(node1?.right, node2?.right)
        }
    }
    
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if root1 == nil { return root2 }
        merge(root1, root2)
        
        return root1
    }
}