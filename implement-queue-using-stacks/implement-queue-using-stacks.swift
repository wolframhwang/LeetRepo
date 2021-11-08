class MyQueue {
    
    var input = [Int]()
    var output = [Int]()
    init() {
        
    }
    
    
    func push(_ x: Int) {
        input.append(x)
    }
    
    func pop() -> Int {
        peek()
        return output.removeLast()
    }
    
    func peek() -> Int {
        if output.isEmpty {
            while !input.isEmpty {
                output.append(input.removeLast())
            }
        }
        return output.last!
    }
    
    func empty() -> Bool {
        return input.isEmpty && output.isEmpty
    }
    
    
}