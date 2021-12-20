/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
	var map: [Int: Int] = [:]
	var idx = 0
	func recur(_ preorder: [Int], _ left: Int, _ right: Int) -> TreeNode? {
		if left > right { return nil }
		var root = preorder[idx]
		idx += 1
		var node: TreeNode? = TreeNode(root)
		node?.left = recur(preorder, left, map[root]! - 1)
		node?.right = recur(preorder, map[root]! + 1, right)
		return node
	}
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
		let node: TreeNode? = TreeNode(preorder[0])
		let ret = node
		idx = 0
		map = [:]
		for i in 0..<inorder.count {
			map[inorder[i]] = i
		}


		return recur(preorder, 0, preorder.count - 1)
    }
}