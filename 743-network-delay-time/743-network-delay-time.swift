class Solution {
    let INF = 987654321
    var map: [[(to: Int, value: Int)]] = []
    var visit: [Int] = []
    var distance = 0
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        map = [[(to: Int, value: Int)]](repeating: [], count: n + 2)
        visit = [Int](repeating: INF, count: n + 2)
        var answer = 0
        var q: [Int] = []
        var front = 0
        var count = 0
        
        for node in times {
            map[node[0]].append((node[1], node[2]))
        }
        q.append(k)
        visit[k] = 0
        count += 1
        while q.count != front {
            let now = q[front]
            front += 1
            
            for nextInfo in map[now] {
                let next = nextInfo.to
                let value = nextInfo.value
                if visit[next] <= visit[now] + value {
                    continue
                }
                if visit[next] == INF { count += 1 }
                visit[next] = visit[now] + value
                q.append(next)
            }
        }
        if count != n { return -1 }
        for n in visit {
            if n == INF { continue }
            answer = max(answer, n)
        }
        return answer
    }
}
