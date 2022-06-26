class Solution {
    func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
        var sum = 0, answer = 0;
        for i in 0..<k {
            sum += cardPoints[i]
        }
        if k >= cardPoints.count {
            return sum
        }
        answer = sum
        for i in 1...k {
            sum = sum + (cardPoints[cardPoints.count - i] - cardPoints[k - i])
            answer = max(sum, answer)
        }
        return answer
    }
}