class Solution {
    var ret: [[Int]] = [[Int]]()
    var isVisit: [Bool] = [Bool]()
    func permute(_ nums: [Int]) -> [[Int]] {
        var retArr: [Int] = Array<Int>()
        isVisit = [Bool]()
        for i in 0...nums.count{
            isVisit.append(false)
        }
        perm(nums,retArr, 0)  
        
        return ret
    }
    
    
    func perm(_ arr: [Int], _ nowArr: [Int], _ now: Int){
        var tempArr = nowArr
        if now == arr.count{
            ret.append(nowArr)
        }
        for index in 0..<arr.count{
            if isVisit[index] == false{
                isVisit[index] = true
                tempArr.append(arr[index])
                perm(arr, tempArr, now + 1)
                isVisit[index] = false
                tempArr.popLast()
            }
        } 
    }
    
}