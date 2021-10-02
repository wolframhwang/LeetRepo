class Solution {
    var answer : [String] = []
    var Limit : Int = 0
    func recur(_ inp: String, _ left: Int, _ right: Int) {
        if left + right == Limit {
            if left == right{
                answer.append(inp)
            }
            return
        }
        if left > right {
            recur(inp + ")", left, right + 1)
        }
        recur(inp + "(", left + 1, right)
    }
    func generateParenthesis(_ n: Int) -> [String] {
        Limit = n * 2
        recur("", 0, 0)
        return answer
    }
}
