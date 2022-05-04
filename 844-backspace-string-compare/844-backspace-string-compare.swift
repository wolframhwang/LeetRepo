class Solution {
    func checkStack(_ t: inout [Character], _ s: inout [Character]) -> Bool {
        if s.count != t.count { return false }
        for i in 0..<s.count {
            if s[i] != t[i] { return false }
        }
        return true
    }
    
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        var stackS: [Character] = []
        var stackT: [Character] = []
        
        for c in s {
            if c == "#" {
                if stackS.isEmpty { continue }
                stackS.popLast()
            } else {
                stackS.append(c)
            }
        }
        
        for c in t {
            if c == "#" {
                if stackT.isEmpty { continue }
                stackT.popLast()
            } else {
                stackT.append(c)
            }
        }
        
        return checkStack(&stackT, &stackS)
    }
}
