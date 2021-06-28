/*
Given a string s and an array of strings words, return the number of words[i] that is a subsequence of s.

A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.

Input: s = "abcde", words = ["a","bb","acd","ace"]
Output: 3
Explanation: There are three strings in words that are a subsequence of s: "a", "acd", "ace".


Input: s = "dsahjpjauf", words = ["ahjpjau","ja","ahbwzgqnuk","tnmlanowax"]
Output: 2

*/

class MatchingSubsequence {
    
    func numMatchingSubseq(_ s: String, _ words: [String]) -> Int {
        var count: Int = 0

        for word in words {
            let isSubsequence = isSubsequencePattern(s, word)

            if isSubsequence {
                count += 1
            }
        }

        return count
    }

    func isSubsequencePattern(_ source: String, _ pattern: String) -> Bool {

        if source.count < pattern.count {
            return false
        }

        var offset: Int = -1
        var count: Int = 0

        for char in pattern {
            for (index, sourceChar) in source.enumerated() {
                if index <= offset {
                    continue
                }
                if char == sourceChar {
                    offset = index
                    count += 1
                    break
                }
            }
        }

        if count == pattern.count {
            return true
        }
        return false
    }
}
