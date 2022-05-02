class Solution {
    var n: Int = 0
    var r: [Bool] = []
    var c: [Bool] = []
    var rc: [Bool] = [] // 우 하
    var cr: [Bool] = [] // 좌 상
    var qTemp: [(x: Int, y: Int)] = []
    var answer: [[String]] = []
    
    func recur(_ x: Int) {
        if x == n {
            var ret : [String] = []
            for i in 0..<n {
                var len = 0
                var inp: String = ""
                while len < n {
                    if qTemp[i].y == len {
                        inp += "Q"
                    } else {
                        inp += "."
                    }
                    len += 1
                }
                ret.append(inp)
            }
            answer.append(ret)
            return
        }
        for i in 0..<n {
            if r[x] == false, c[i] == false, rc[n - (x - i)] == false, cr[x + i] == false {
                r[x] = true
                c[i] = true
                rc[n - (x - i)] = true
                cr[x + i] = true
                qTemp.append((x, i))
                recur(x + 1)
                qTemp.popLast()
                r[x] = false
                c[i] = false
                rc[n - (x - i)] = false
                cr[x + i] = false
            }
        }
    }
    
    func solveNQueens(_ n: Int) -> [[String]] {
        r = [Bool](repeating: false, count: n)
        c = [Bool](repeating: false, count: n)
        rc = [Bool](repeating: false, count: n * 2)
        cr = [Bool](repeating: false, count: n * 2)
        self.n = n
        
        recur(0)
        
        return answer
    }
}