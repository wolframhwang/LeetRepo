class Solution {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    var visit: [[Bool]] = []
    var grids: [[Character]] = []
    func bfs(_ x: Int, _ y: Int) {
        var q: [(x: Int, y: Int)] = []
        var front = 0
        
        q.append((x: x, y: y))
        visit[x][y] = true
        while q.count != front {
            let now = q[front]
            front += 1
            
            for i in 0..<4 {
                let nx = now.x + dx[i]
                let ny = now.y + dy[i]
                if nx < 0 || nx >= grids.count || ny < 0 || ny >= grids[0].count { continue }
                if grids[nx][ny] == "0" { continue }
                if visit[nx][ny] { continue }
                visit[nx][ny] = true
                q.append((x: nx, y: ny))
            }
        }
    }
    
    func numIslands(_ grid: [[Character]]) -> Int {
        var answer = 0
        
        grids = grid
        let rangeRow = 0..<grid.count
        let rangeCol = 0..<grid[0].count
        
        visit = [[Bool]](repeating: [Bool](repeating: false, count: grid[0].count), count: grid.count)
        
        for i in rangeRow {
            for j in rangeCol {
                if grid[i][j] == "0" { continue }
                if visit[i][j] { continue }
                bfs(i, j)
                answer += 1
            }
        }
        
        return answer
    }
}
