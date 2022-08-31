import UIKit


protocol Container {
    associatedtype ElementType
    var count: Int {get}
    var elements:[ElementType] {get set}
    mutating func pushElement(element: ElementType?)
    mutating func popElement()-> ElementType?
    func printAll()
}

struct Stack<T> : Container {
    var elements = [T]()
    var count: Int {
        return elements.count
    }
    mutating func pushElement(element: T?) {
        if let element = element {
            elements.append(element)
        }
    }
    mutating func popElement()->T? {
        if self.elements.isEmpty {
            return nil
        }
        let last = self.elements.last
        self.elements.removeLast()
        return last
    }
    func printAll() {
        
    }
}

var intTypeStack = Stack<Int>()
intTypeStack.pushElement(element: 1)
intTypeStack.pushElement(element: 2)
intTypeStack.pushElement(element: 3)
intTypeStack.pushElement(element: 4)


print("total elements in stack",intTypeStack.count)
print("remove element from stack is", intTypeStack.popElement())
print("remove element from stack is", intTypeStack.popElement())
print("remove element from stack is", intTypeStack.popElement())

print("After removing count is",intTypeStack.count)

class Vehicle {
    var wheel: Int
    init(wheel: Int) {
        self.wheel = wheel
    }
}

class Truck: Vehicle {
    var capacity: Int
    init(capacity: Int, wheels: Int) {
        self.capacity = capacity
        super.init(wheel: wheels)
    }
}
extension Truck: CustomStringConvertible {
    var description: String {
        return "\(self.capacity) and \(self.wheel)"
    }
}

print(Truck.init(capacity: 12, wheels: 12))

let dict = ["Anupam":"ten", "chug":"10"]
let finishers1 = dict.compactMapValues { Int($0) } // work on value
print(finishers1)


protocol Info {
    var name: String { get }
    var serial: Int { get }
}

struct Person: Info, CustomStringConvertible {
    // notice that Person now conforms to CustomStringConvertible
    var name = "Gurjiner Singh"
    var serial = 10
//    var snmae = "Soni"
}
//extension Person {
//    var description: String {
//        return "\(self.name)"
//    }
//}

 //the extension only applies to objects that themselves conform to
//CustomStringConvertible
extension Info   {
    var description: String {
        return "\(name) + \(serial)"
    }
}
let personObj = Person()
print(personObj.description)

class Node<T: Equatable> { // Equatable is there to compare
  var value: T? 
  var next: Node?
}

class LinkedList<T: Equatable> {
    var head = Node<T>()
    
    func insert(value: T) {
        //find to see if empty list
        if self.head.value == nil {
            self.head.value = value
        } else {
            //find the last node without a next value
            var lastNode = self.head
            while lastNode.next != nil {
                lastNode = lastNode.next!
            }
            //once found, create a new node and connect the linked list
            let newNode = Node<T>()
            newNode.value = value
            lastNode.next = newNode
        }
    }
    
    func remove(value: T) {
      //Check if the value is at the head
      if self.head.value == value {
        self.head = self.head.next!
      }
    //Traverse the linked list to see if node is in the linked list
    if self.head.value != nil {
        var node = self.head
        var previousNode = Node<T>()
        //If value found, exit the loop
        while node.value != value && node.next != nil {
          previousNode = node
          node = node.next!
        }
        //once found, connect the previous node to the current node's next
        if node.value == value {
          if node.next != nil {
            previousNode.next = node.next
          } else {
            //if at the end, the next is nil
            previousNode.next = nil
          }
        }
      }
    }
    
    func printAllKeys() {
      var current: Node! = self.head
      print("---------------")
    while current != nil && current.value != nil {
        print("The item is \(current.value!)")
        current = current.next
      }
    }
}

var myList = LinkedList<Int>()
myList.insert(value: 100)
myList.insert(value: 200)
myList.insert(value: 300)
myList.remove(value: 100)
myList.printAllKeys()


func printAlphabet(number: Int) {
    if (number <= 122) {
        print(number)
        printAlphabet(number: number + 1)
    }
}
print(printAlphabet(number: 97))




//var number = 1
//func increment(number: inout Int) {
//        number += 1
//}
//print(number)
//increment(number: &number)
//print(number)



var greeting = "Hello, playground"

func addTwoNumbers(n1 num1: Int, n2 num2: Int) -> Int {
    let sum = num1 + num2
    return sum
}
func addTwoNumbers1(_ num1: Int, _ num2: Int) -> Int {
    let sum = num1 + num2
    return sum
}
func addTwoNumbers2(num1: Int, num2: Int) -> Int {
    let sum = num1 + num2
    return sum
}
//print(addTwoNumbers(n1: 12, n2: 12))
//print(addTwoNumbers1(12, 12))
//print(addTwoNumbers2(num1: 12, num2: 12))

//Closure

let sum = { (num1: Int, num2:Int) -> Int in
    return num1 + num2
}
//print(sum(1,2))

let printc = { () -> Void in
    print("print in clsoure")
}

print(printc)

//class Person {
//    var lightsaberColor = "Blue"
//    var lightSaberColorlet = "Blue"
//
//    static var count: Int {
//        50
//    }
//    static let num = 10
//    class var age: Int {
//        return 90
//    }
//    let name = "gurjinder singh"
//    var anum: Int {
//        10
//    }
//
//}
//
//class Student: Person {
//    override var lightSaberColorlet : String{return "Red"}
//
//    override var lightsaberColor : String {
//            get {
//                return "Red"
//            }
//            set {
//                // nothing, because only red is allowed
//            }
//        }
//    override class var age: Int{
//        return 10
//    }
//}

//print(Person.num)

//class SomeClass {
//    var hello = "hello"
//}
//class ChildClass: SomeClass {
//    override var hello: String {
//        set {
//            super.hello = newValue
//        }
//        get {
//            return super.hello
//        }
//    }
//}
//print(ChildClass().hello = "nice")
//print(ChildClass().hello)
//print(SomeClass().hello)
//print(SomeClass().hello)
//print(SomeClass().hello)
//print(ChildClass().hello)
//print(ChildClass().hello)
class SomeClass {
    var hello = "hello"
}
class ChildClass: SomeClass {
    override var hello: String {
        set {
            _hello = newValue
        }
        get {
            _hello
        }
    }
    private var _hello: String = ""
}


// Testing...
let c = ChildClass()
c.hello = "test"
print(c.hello) // test
