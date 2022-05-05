
class MyStack {
    var q1: [Int]
    var front1: Int
    var q2: [Int]
    var front2: Int
    init() {
        q1 = []
        q2 = []
        front1 = 0
        front2 = 0
    }
    
    func push(_ x: Int) {
        while q1.count != front1 {
            q2.append(q1[front1])
            front1 += 1
        }
        q1.append(x)
    }
    
    func pop() -> Int {
        let ret = q1[front1]
        front1 += 1
        if q2.count - front2 > 0 {
            for i in 0..<(q2.count - front2 - 1) {
                q2.append(q2[front2])
                front2 += 1
            }
            q1.append(q2[front2])
            front2 += 1
        }
        return ret
    }
    
    func top() -> Int {
        return q1[front1]
    }
    
    func empty() -> Bool {
        return (q1.count == front1) && (q2.count == front2)
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
