class Solution {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    var board: [[Character]] = []
    var visit: [[Bool]] = []
    var wordFound: Bool = false
    var word: [Character] = []
    
    func recur(_ x: Int, _ y: Int, _ index: Int) {
        if index >= word.count {
            wordFound = true
            return
        }
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || nx >= board.count || ny < 0 || ny >= board[0].count { continue }
            
            if visit[nx][ny] { continue }
            if board[nx][ny] != word[index] { continue }
            
            visit[nx][ny] = true
            recur(nx, ny, index + 1)
            visit[nx][ny] = false
        }
        
        
    }
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {        
        self.board = board
        
        
        let N = board.count
        let M = board[0].count        
        
        visit = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)
        
        for c in word {
            self.word.append(c)
        }
        
        for i in 0..<N {
            for j in 0..<M {
                if wordFound { return true }
                if wordFound == false, board[i][j] == self.word[0] {
                    visit[i][j] = true
                    recur(i, j, 1)
                    visit[i][j] = false
                }
            }
        }
        
        return wordFound
    }
}