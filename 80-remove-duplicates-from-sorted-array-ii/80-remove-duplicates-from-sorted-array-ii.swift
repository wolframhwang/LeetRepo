class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var ret = 0
        
        var q: [Int] = []
        var front = 0
        
        var beforeNumber = -1
        var beforeCount = 0
        var duplicatedNumber = 0
        
        for i in 0..<nums.count {
            let n = nums[i]
            
            if beforeNumber != n {
                beforeNumber = n
                beforeCount = 1
                if front != q.count {
                    let index = q[front]
                    front += 1
                
                    let temp = nums[index]
                    nums[index] = nums[i]
                    nums[i] = temp
                    
                    q.append(i)
                }
            } else {
                beforeCount += 1
                if beforeCount >= 3 {
                    q.append(i)
                    duplicatedNumber += 1
                } else {
                    if front != q.count {
                        let index = q[front]
                        front += 1
                    
                        let temp = nums[index]
                        nums[index] = nums[i]
                        nums[i] = temp
                        
                        q.append(i)
                    }
                }
            }
        }
        
        return nums.count - duplicatedNumber
    }
}
