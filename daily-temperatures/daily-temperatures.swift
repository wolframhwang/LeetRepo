class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack : [Int] = []
        var answer : [Int] = [Int](repeating: 0, count: temperatures.count)
        for i in 0..<temperatures.count {
            if stack.count == 0 {
                stack.append(i)
            }else {
                if temperatures[stack.last!] < temperatures[i] {
                    while stack.count != 0,temperatures[stack.last!] < temperatures[i]{
                        let now = stack.last!
                        answer[now] = i - now
                        stack.popLast()
                    }
                }
                stack.append(i)
            }
        }
        
        return answer
    }
}
