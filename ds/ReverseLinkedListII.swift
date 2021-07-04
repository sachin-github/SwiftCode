/*
Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.

Input: head = [1,2,3,4,5], left = 2, right = 4
Output: [1,4,3,2,5]

Input: head = [5], left = 1, right = 1
Output: [5]

*/

import UIKit

class ReverseLinkedListII {
    
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var node: ListNode? = head
        var previous: ListNode?
        var count: Int = 1
        var listHead: ListNode? = head
        
        while node != nil {
            if count == left {
                node = reverseSubList(previous, node!, left, right)
                break
            }
            count += 1
            previous = node
            node = node?.next
        }
        
        switch left {
        case 1:
            listHead = node
            break
        default:
            previous?.next = node
        }
        
        return listHead
    }
    
    func reverseSubList(_ previous: ListNode?, _ current: ListNode?, _ initialVal: Int, _ right: Int) -> ListNode {
        
        var curr: ListNode? = current
        var prev: ListNode? = nil
        var future: ListNode?
        var count: Int = initialVal
        
        while curr != nil && count <= right {
            future = curr?.next
            curr?.next = prev
            prev = curr
            curr = future
            count += 1
        }
        
        
        current?.next = future
        
        return prev!
    }
    
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
    func driverMethod() {
        let one = ListNode(1)
        let two = ListNode(2)
        let three = ListNode(3)
        let four = ListNode(4)
        let five = ListNode(5)
        
        two.next = two; two.next = three; three.next = four; four.next = five
        
        var node: ListNode? = one
        while node != nil {
            print("\(String(describing: node?.val)), ")
            node = node?.next
        }
        
        print("Reversing list")
        
        var head: ListNode? = reverseBetween(one, 1, 1)
        
        print("Reversed list")
        
        while head != nil {
            print("\(String(describing: head?.val)), ")
            head = head?.next
        }
    }
}

