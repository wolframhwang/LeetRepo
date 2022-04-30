class Solution {
    var parent: [String: String] = [:]
    
    func getParent(a: String) -> String {
        if a == parent[a, default: ""] { return a }
        parent[a] = getParent(a: parent[a, default: ""])
        return parent[a, default: ""]
    }
    
    func unionParent(_ a: String, _ b: String) {
        let a = getParent(a: a)
        let b = getParent(a: b)
        
        if a < b {
            parent[b] = a
        } else {
            parent[a] = b
        }
    }
    
    func getSimilar(_ str1: String, _ str2: String) -> Bool {
        if getParent(a: str1) == getParent(a: str2) { return false }
        let range = 0..<str1.count
        
        var diff: [(Character?, Character?)] = []
        for i in range {
            if str1[i] != str2[i] {
                diff.append((str1[i], str2[i]))
            }
            if diff.count > 2 { return false }
        }
        if diff.count != 2 { return false }
        if diff[0].0 == diff[1].1, diff[0].1 == diff[1].0 {
            return true
        }
        return false
    }
        
    func numSimilarGroups(_ strs: [String]) -> Int {
        var groups = Set<String>()
        for str in strs {
            parent[str] = str
        }
        // O(10000000)
        for (key1, value1) in parent {
            for (key2, value2) in parent {
                if key1 == key2 { continue }
                if getSimilar(key1, key2) {
                    unionParent(key1, key2)
                }
            }
        }
        
        for i in 0..<strs.count {
            groups.insert(getParent(a: strs[i]))
        }
        return groups.count
    }
}

extension String {
    subscript(idx: Int) -> Character {
        let target = index(startIndex, offsetBy: idx)
        return self[target]
    }
}