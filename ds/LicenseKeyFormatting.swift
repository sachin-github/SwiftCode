/*
We want to reformat the string s such that each group contains exactly k characters, except for the first group, which could be shorter than k but still must contain at least one character. Furthermore, there must be a dash inserted between two groups, and you should convert all lowercase letters to uppercase.

Input: s = "5F3Z-2e-9-w", k = 4
Output: "5F3Z-2E9W"
Explanation: The string s has been split into two parts, each part has 4 characters.
Note that the two extra dashes are not needed and can be removed.


Input: s = "2-5g-3-J", k = 2
Output: "2-5G-3J"
Explanation: The string s has been split into three parts, each part has 2 characters except the first part as it could be shorter as mentioned above.


//let str: String = "5F3Z-2e-9-w"
//let k: Int = 4
//let str: String = "2-5g-3-J"
//let k: Int = 2
//let str: String = "2-4A0r7-4k"
//let k: Int = 3
let str: String = "--a-a-a-a--"
let k: Int = 2
*/

class LicenseKeyFormatting {
    func licenseKeyFormatting(_ s: String, _ k: Int) -> String {
        var licenseKeyTemp: String = ""
        var counter: Int =  0
        var foundCharacter: Bool = false

        for (_, char) in s.enumerated() {
            if !foundCharacter && char != "-" {
                foundCharacter = true
            }
            if foundCharacter {
                licenseKeyTemp.append(char)
            }
        }

        let reversedString: [Character] = licenseKeyTemp.reversed()
        licenseKeyTemp = ""

        for char in reversedString {

            if counter < k {

                switch char {
                case "-":
                    continue
                default:
                    licenseKeyTemp.append(char)
                    counter += 1
                }
            }
            else {
                licenseKeyTemp.append("-")
                if char != "-" {
                    licenseKeyTemp.append(char)
                    counter = 1
                }
                else {
                    counter = 0
                }
            }
        }

        var licenseKey: String = ""

        for char in licenseKeyTemp.reversed() {
            licenseKey.append(char)
        }

        return licenseKey.uppercased()
    }
}
