
class Trie {
    var c: [Character: Trie] = [:]
    var words: [String] = []
}

class Solution {
    let root = Trie()
    var product: [String] = []
    func fillTrie() {
        for p in product {
            var current = root
            for c in p {
                if current.c[c] == nil {
                    current.c[c] = Trie()
                }
                current = current.c[c, default: Trie()]
                current.words.append(p)
            }
        }
    }
    
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        var ret = [[String]]()
        product = products.sorted()
        
        fillTrie()
        
        var current = root
        let arr = Array(searchWord)
        
        for i in 0..<arr.count {
            let c = arr[i]
            if current.c[c] == nil {
                for _ in i..<searchWord.count {
                    ret.append([])
                }
                return ret
            } else {
                current = current.c[c, default: Trie()]
                if current.words.endIndex > 3 {
                    ret.append(Array(current.words[0..<3]))
                } else {
                    ret.append(current.words)
                }
            }
        }
        return ret
    }
}
