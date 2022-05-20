class Solution {
    var answer: [[Int]] = []
    var inputArray: [Int] = []
    var visit: [Bool] = []
    var k = 0, n = 0
    
    func recur(_ now: Int) {
        if now == n + 1 { return }
        if inputArray.count == k {
            answer.append(inputArray)
            return
        }
        for i in now..<n {
            inputArray.append(i)
            recur(i + 1)
            inputArray.removeLast()            
        }
    }
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        self.n = n + 1
        self.k = k
        
        
        visit = [Bool](repeating: false, count: n + 1)
        
        recur(1)
        
        return answer
        
    }
}