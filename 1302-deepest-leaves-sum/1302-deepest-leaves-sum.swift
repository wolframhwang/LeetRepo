
class Solution {
    var levelCount = [Int](repeating: 0, count: 100)
    var highestLevel = 0
    
    func recur(_ node: TreeNode?, _ level: Int) {
        highestLevel = max(highestLevel, level)
        levelCount[level] += (node?.val ?? 0)
        if node?.left != nil {
            recur(node?.left, level + 1)
        }
        if node?.right != nil {
            recur(node?.right, level + 1)
        }
    }
    
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        recur(root, 0)
        
        return levelCount[highestLevel]
    }
}
