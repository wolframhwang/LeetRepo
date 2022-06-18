
class Solution {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]

    var visit: [[Bool]] = []
    var map: [[Int]] = []
    var n = 0, m = 0

    func bfs(_ x: Int, _ y: Int) -> Int {
        var q: [(x: Int, y: Int)] = [(x, y)]
        var front = 0
        var ret = 0
        visit[x][y] = true
        
        while q.count != front {
            let now = q[front]
            front += 1
            
            for i in 0..<4 {
                let nx = now.x + dx[i]
                let ny = now.y + dy[i]
                
                if nx < 0 || nx >= n || ny < 0 || ny >= m || map[nx][ny] == 0 {
                    ret += 1
                    continue
                }
                if visit[nx][ny] { continue }
                visit[nx][ny] = true
                q.append((nx, ny))
            }
        }

        return ret
    }
    
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        n = grid.count
        m = grid[0].count
        map = grid
        visit = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
        
        var answer = 0
        
        for i in 0..<n {
            for j in 0..<m {
                if map[i][j] == 0 { continue }
                if visit[i][j] { continue }
                answer += bfs(i, j)
            }
        }
        
        return answer
    }
}
