// Forward Swift Taster Workshop
// presented by @twostraws

import UIKit
import Foundation

// Closures
// - clojures are always reference types
let greetPerson = {
    print("Hello")
}

greetPerson()

func runSomeClosure(_ closure: () -> Void) {
    closure()
}

runSomeClosure(greetPerson)


// 2)
let numbers = [1, 3, 5 ,7, 9]
numbers.reduce(0) { (int1, int2) -> Int in
    return int1 + int2
}
numbers.reduce(0, +) // same as the line above


// 3)
let input = "My favorite album is Fearless"
let words = ["1989", "Fearless", "Red"]

words.contains(where: input.contains)

// Auto Closures
print("")
func printTest(_ result: @autoclosure() -> Void) {
    print("Before")
    result()
    print("After")
}

printTest(
    print("Hello")
)


// Errors
// - non-throwing functions are subtype of throwing functions
// - this is interesting when we pass functions as parameters
print("")

enum Failure: Error {
    case badNetwork(message: String)
    case broken
}

func fetchRemote() throws -> String {
    // complicated failable work
    throw Failure.broken
}

func fetchLocal() -> String {
    // this wont throw
    return "Taylor"
}

//func fetchUserData(using closure: () throws -> String) {
//    do {
//        let userData = try closure()
//        print("User data received: " + userData)
//    } catch Failure.broken {
//        print("Broken")
//    } catch {
//        print("Fetch error")
//    }
//}

func fetchUserData(using closure: () throws -> String) rethrows {
        let userData = try closure()
        print("User data received: " + userData)
    
}

try fetchUserData(using: fetchLocal) // Xcode can evaluate that this closure is not going to throw errors and therefore does not have to be embedded in a try-catch block

do {
    try fetchUserData(using: fetchRemote)
} catch Failure.broken {
    print("Broken")
} catch {
    print("Fetch error")
}

// Functional programming
print()

func lengthOf(strings: [String]) -> [Int] {
//    var result = [Int]()
//    
//    for string in strings {
//        result.append(string.characters.count)
//    }
//    
//    return result
    return strings.map({ $0.characters.count })
}

lengthOf(strings: ["Taylor", "Paul", "Adele"])

let friuts = ["Apple", "Pineapple"]
let upperFruits = friuts.map({ $0.uppercased() })
upperFruits

let scores = [100, 80, 85]
let formatted = scores.map{ "Your score was \($0)"}
print(formatted)

//let numbers: [Double] = [4, 9, 25, 36, 49]
//let result: [Double] = numbers.map(sqrt)
//print(result)

["Taylor", "Paul", "Adele"].forEach{ print($0) } // goes through on the elements in their order

let matrix = [[1, 2], [3, 4], [5, 6]]
let joinedNumbers = Array(matrix.joined())

let albums: [String?] = ["Fearless", nil, "Speak now", nil, "Red"]
// let joinedAlbums = albums.map{ $0 } // does not remove nils and returns [String?]
let joinedAlbums = albums.flatMap{ $0 } // removes nils and returns [String] - it is a map and a join + nil removal of results

print(joinedAlbums)

let grades = ["100", "90", "Fish", "40"] // convert these to [Int]
let convertedGrades = grades.flatMap{ Int($0) }
print(convertedGrades)

print()
//do {
//    let savedText = try String(contentsOfFile: "saved.txt")
//    print(savedText)
//} catch {
//    print("Failed to load saved text")
//}
let savedText = (try? String(contentsOfFile: "saved.txt")) ?? "File not found"


















