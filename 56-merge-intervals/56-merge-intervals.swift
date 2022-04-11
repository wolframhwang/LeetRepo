class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
		// intervals 는...
		var answer: [[Int]] = []
        let interval = intervals.sorted { 
			if $0[0] < $1[0] { return true }
			else if $0[0] == $1[0] {
				return $0[1] < $1[1]
			}
			return false
		}

		var prefixLastTime: [Int] = [Int](repeating: 0, count: interval.count)
		prefixLastTime[0] = interval[0][1]
		for i in 1..<interval.count {
			if interval[i][1] > prefixLastTime[i - 1] {
				prefixLastTime[i] = interval[i][1]
			}else {
				prefixLastTime[i] = prefixLastTime[i - 1]
			}
		}

		var indicator = prefixLastTime[0]
		var now = 1
		var add : [Int] = [interval[0][0], 0]
		while true {
            if now >= interval.count { break }
			if indicator >= interval[now][0] {
				if indicator < prefixLastTime[now] {
					indicator = prefixLastTime[now]
				}
			} else {
				add[1] = indicator
				answer.append(add)
				add[0] = interval[now][0]
				indicator = prefixLastTime[now]
			}
			now += 1
		}
        add[1] = prefixLastTime[prefixLastTime.count - 1]
        answer.append(add)
		return answer
    }
}