class Solution {
    var stk: [TreeNode?] = []
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var dummyRoot = root
        var K = k
        while true{
            while dummyRoot != nil{
                stk.append(dummyRoot)
                if let DRoot = dummyRoot{                
                    if let left = DRoot.left{
                        dummyRoot = left
                    }
                    else{
                        dummyRoot = nil
                        break
                    }
                }
            }
            if let DDMM = stk.popLast(){
                dummyRoot = DDMM
            }
        
            K -= 1
            if K == 0 {
                if let dm = dummyRoot{
                    return dm.val
                }else{
                    return 0
                }
            }
            if let Dm = dummyRoot{
                if let right = Dm.right{
                    dummyRoot = right
                }else{
                    dummyRoot = nil
                }
            }else{
                dummyRoot = nil
            }
        }
    }
}