class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        if nums.count == 0 { return [] }
        if nums.count == 1 { return nums }
        let range = 1..<nums.count
        
        var answer: [Int] = [Int](repeating: 0, count: nums.count)
        
        answer[0] = nums[0]
        
        for i in range {
            answer[i] = nums[i] + answer[i - 1]
        }
        
        return answer
    }
}
