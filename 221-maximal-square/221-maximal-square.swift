class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        let N = matrix.count
        let M = matrix[0].count
        let rangeN = 0..<N
        let rangeM = 0..<M

        var dpRow : [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: matrix[0].count), count: matrix.count)
        var dpCol : [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: matrix[0].count), count: matrix.count)
        var answer = 0
        
        if matrix[0][0] == "1" {
            dpRow[0][0] = 1
            dpCol[0][0] = 1
        }

        for i in rangeN {
            for j in rangeM {
                if matrix[i][j] == "1" {
                    if i == 0 {
                        dpRow[i][j] = 1
                    }
                    else { dpRow[i][j] = dpRow[i - 1][j] + 1 }
                }
                if matrix[i][j] == "1" {
                    if j == 0 {
                        dpCol[i][j] = 1
                    }
                    else { dpCol[i][j] = dpCol[i][j - 1] + 1 }
                }

            }
        }
        

        for i in rangeN {
            for j in rangeM {
                if matrix[i][j] == "1" {
                    let val = findDP(i, j, dpRow, dpCol, N, M)
                    if val > answer {
                        answer = val
                    }
                }
            }
        }


        return answer * answer
    }
}

func findDP(_ x: Int, _ y: Int, _ dpRow: [[Int]], _ dpCol: [[Int]], _ N: Int, _ M: Int) -> Int {
    var ret = 1
    var dx = x
    var dy = y

    while true {
        if dx >= N || dy >= M { return ret - 1 }
        if dpRow[dx][dy] == 0 || dpCol[dx][dy] == 0 { return ret - 1}
        if dpRow[x][dy] == 0 || dpCol[dx][y] == 0 { return ret - 1 }
        if dpRow[dx][dy] - dpRow[x][dy] != ret - 1 || dpCol[dx][dy] - dpCol[dx][y] != ret - 1 {
            return ret - 1
        }
        ret += 1
        dx += 1
        dy += 1        
    }
    return ret
}