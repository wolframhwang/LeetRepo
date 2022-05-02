class Solution {
    let dx = [0,1,0,-1]
    let dy = [1,0,-1,0] // 동 서 남 북
    func generateMatrix(_ n: Int) -> [[Int]] {
        var ret: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        var visit: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        var dir = 0
        var x = 0, y = 0
        var rotate = 0
        
        ret[0][0] = 1
        visit[0][0] = true
        while true {
            if rotate == 2 { break }
            let nx = x + dx[dir], ny = y + dy[dir]
            if nx < 0 || nx >= n || ny < 0 || ny >= n { dir += 1; dir %= 4; rotate += 1; continue }
            if visit[nx][ny] { dir += 1; dir %= 4; rotate += 1; continue }
            visit[nx][ny] = true
            ret[nx][ny] = ret[x][y] + 1
            x = nx; y = ny
            rotate = 0
        }

        return ret
    }
}