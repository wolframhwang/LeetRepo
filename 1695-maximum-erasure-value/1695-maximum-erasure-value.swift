class Solution {
    var map: [Int] = [Int](repeating: 0, count: 10010)
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        var left = 0, right = 0
        var sum = 0, answer = 0
        
        while right < nums.count {
            let next = nums[right]
            sum += next
            map[next] += 1
            right += 1
            
            while map[next] > 1 {
                sum -= nums[left]
                map[nums[left]] -= 1
                left += 1
            }
            answer = max(answer, sum)
        }
        
        return answer
    }
}
