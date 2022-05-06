/*
 1 <= s.length <= 10^5
 2 <= k <= 10^4
 
 ->
 */
class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        var stack: [(char: Character, val: Int)] = []
        var answer = ""
        for c in s {
            if !stack.isEmpty {
                if stack.last!.val == k {
                    stack.popLast()!
                }
                if stack.isEmpty {
                    stack.append((c, 1))
                } else {
                    if stack.last!.char == c {
                        stack[stack.count - 1].val += 1
                    } else {
                        stack.append((c, 1))
                    }
                }
            } else {
                stack.append((c, 1))
            }
        }
        
        if !stack.isEmpty, stack.last!.val == k {
            stack.popLast()!
        }
        
        for pair in stack {
            for _ in 0..<pair.val {
                answer.append(pair.char)
            }
        }
        
        return answer
    }
}