class Solution {
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var ret: [Int] = []
        var visit: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: matrix[0].count), count: matrix.count)
        var x = 0, y = 0
        var dir = 0
        var refCnt = 0
        ret.append(matrix[0][0])
        visit[0][0] = true
        while true {
            if refCnt >= 2 { break }
            dir %= 4
            let nx = x + dx[dir]
            let ny = y + dy[dir]
            if nx < 0 || nx >= matrix.count || ny < 0 || ny >= matrix[0].count { dir += 1; refCnt += 1; continue }
            if visit[nx][ny] { dir += 1; refCnt += 1; continue }
            visit[nx][ny] = true
            ret.append(matrix[nx][ny])
            x = nx; y = ny
            refCnt = 0
        }
        
        return ret
    }
}
