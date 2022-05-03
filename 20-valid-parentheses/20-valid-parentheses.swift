class Solution {
    var stack: [Character] = []
    var sp = 0
    func isEmptyStack() -> Bool {
        return sp == 0
    }
    
    func isValid(_ s: String) -> Bool {
        if s.count % 2 == 1 { return false }
        for c in s {
            switch c {
            case "(":
                stack.append(c)
                sp += 1
            case ")":
                if isEmptyStack() { return false }
                if stack[sp - 1] == "(" { stack.popLast(); sp -= 1 }
                else { print(stack); return false }
            case "{":
                stack.append(c)
                sp += 1
            case "}":
                if isEmptyStack() { return false }
                if stack[sp - 1] == "{" { stack.popLast(); sp -= 1 }
                else { return false }
            case "[":
                stack.append(c)
                sp += 1
            case "]":
                if isEmptyStack() { return false }
                if stack[sp - 1] == "[" { stack.popLast(); sp -= 1 }
                else { return false }
            default:
                break
            }
        }
        if !isEmptyStack() { return false }
        return true
    }
}

