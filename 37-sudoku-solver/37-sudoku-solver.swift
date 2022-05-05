class Solution {
    var row: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: 10), count: 10)
    var col: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: 10), count: 10)
    var box: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: 10), count: 10)
    
    var nextStep: [(x: Int, y: Int)] = []
    var digit: [Int: Character] = [:]
    var chara: [Character: Int] = [:]
    var ret: [[Character]] = []
    var ans: [[Character]] = []
    var ss = 0
    
    func recur(_ index: Int) {
        if index == nextStep.count {
            ans = ret
            return
        }
        let x = nextStep[index].x, y = nextStep[index].y

        let j = (x / 3) * 3 + y / 3
        for i in 1...9 {
            if row[x][i] { continue }
            if col[y][i] { continue }
            if box[j][i] { continue }
            row[x][i] = true
            col[y][i] = true
            box[j][i] = true
            ret[x][y] = digit[i]!
            recur(index + 1)
            box[j][i] = false
            col[y][i] = false
            row[x][i] = false
        }
        // 4 % 3 = 1,  7 % 3 = 2
    }

    func solveSudoku(_ board: inout [[Character]]) {
        let s = "123456789"
        ret = board
        var id = 1
        for c in s {
            digit[id] = c
            chara[c] = id
            id += 1
        }
        
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if board[i][j] == "." {
                    nextStep.append((i, j))
                } else {
                    let val = chara[board[i][j]]!
                    let index = (i / 3) * 3 + j / 3
                    row[i][val] = true
                    col[j][val] = true
                    box[index][val] = true
                }
            }
        }
        
        recur(0)
        board = ans
    }
}
