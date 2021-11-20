class Solution {
    var arr : [[Int]] = []
    var mx : Int = 0
    func go(_ node: TreeNode?, _ cnt : Int){
        if node == nil {
            return
        }
        if let v = node?.val {
            if arr.count <= cnt {
                let layer : [Int] = [v]
                arr.append(layer)
            }else{
                arr[cnt].append(v)   
            }
            if mx < cnt {
                mx = cnt
            }
        }
        go(node?.left, cnt + 1)
        go(node?.right, cnt + 1)
    }
    func rightSideView(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var ans : [Int] = []        
        let layer: [Int] = []
        arr = [[Int]](repeating: layer, count : 2)
        go(root, 1)
        for i in 1...mx {
            if arr[i].count > 0 {
                ans.append(arr[i][arr[i].count - 1])
            }
        }
        return ans
    }
}