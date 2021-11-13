

class Solution {
    var answer : [[Int]] = []
    func recur(_ node: TreeNode?, _ level: Int) {
        if node != nil {
            if answer.count == level {
                answer.append([node?.val ?? 0])
            }else {
                answer[level].append(node?.val ?? 0)
            }
        }
        if node?.left != nil {
            recur(node?.left, level + 1)
        }
        if node?.right != nil {
            recur(node?.right, level + 1)
        }
    }
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return answer
        }
        
        recur(root, 0)
        
        return answer
    }
}
