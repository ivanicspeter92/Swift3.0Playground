//
//  QueueWithTwoStacksTests.swift
//  QueueWithTwoStacksTests
//
//  Created by Peter Ivanics on 20/09/16.
//  Copyright © 2016 Peter Ivanics. All rights reserved.
//

import XCTest
@testable import QueueWithTwoStacks

class QueueWithTwoStacksTests: XCTestCase {
    // MARK: - Append and pop tests
    func testPoppingFromEmptyQueue() {
        var queue = QueueWithTwoStacks<Int>()
        
        XCTAssertNil(queue.pop())
    }
    
    func testPoppingOneItem() {
        var queue = QueueWithTwoStacks<Int>()
        queue.append(item: 5)
        
        XCTAssertEqual(5, queue.pop())
    }
    
    func testPoppingTwoItems() {
        var queue = QueueWithTwoStacks<Int>()
        queue.append(item: 5)
        queue.append(item: 6)
        
        XCTAssertEqual(5, queue.pop())
        XCTAssertEqual(6, queue.pop())
    }
    
    func testPoppingThreeItems() {
        var queue = QueueWithTwoStacks<Int>()
        queue.append(item: 5)
        queue.append(item: 6)
        queue.append(item: 7)
        
        XCTAssertEqual(5, queue.pop())
        XCTAssertEqual(6, queue.pop())
        XCTAssertEqual(7, queue.pop())
    }
    
    func testPoppingManyItems() {
        var queue = QueueWithTwoStacks<Int>()
        let elements: [Int] = [ 1, 2, 5, 6, 2, 2, 7 ,2 ,6, 8, 32, 342, 645, 2423, -1243, 2443, 54 ]
        
        for item in elements {
            queue.append(item: item)
        }
        
        for item in elements {
            XCTAssertEqual(item, queue.pop())
        }
    }
    
    func testPretendingAndPoppingItems() {
        var queue = QueueWithTwoStacks<Int>()
        
        queue.append(item: 1)
        queue.append(item: 2)
        queue.append(item: 3)
        
        XCTAssertEqual(1, queue.pop())
        XCTAssertEqual(2, queue.pop())
        
        queue.append(item: 4)
        queue.append(item: 5)
        
        XCTAssertEqual(3, queue.pop())
        XCTAssertEqual(4, queue.pop())
        XCTAssertEqual(5, queue.pop())
        XCTAssertEqual(nil, queue.pop())
        
        queue.append(item: 6)
        queue.append(item: 7)
        
        XCTAssertEqual(6, queue.pop())
        XCTAssertEqual(7, queue.pop())
        XCTAssertEqual(nil, queue.pop())
    }
    
    func testPoppingOneCharacter() {
        var queue = QueueWithTwoStacks<Character>()
        queue.append(item: "a")
        
        XCTAssertEqual("a", queue.pop())
    }
    
    func testPoppingThreeCharacters() {
        var queue = QueueWithTwoStacks<Character>()
        queue.append(item: "a")
        queue.append(item: "b")
        queue.append(item: "c")
        
        XCTAssertEqual("a", queue.pop())
        XCTAssertEqual("b", queue.pop())
        XCTAssertEqual("c", queue.pop())
    }
    
    // MARK: - Count tests
    func testEmptyQueueCountShouldBeZero() {
        let queue = QueueWithTwoStacks<Int>()
        
        XCTAssertEqual(0, queue.count)
    }
    
    func testQueueCountWithOneElementWithoutManipulation() {
        var queue = QueueWithTwoStacks<Int>()
        
        queue.append(item: 100)
        XCTAssertEqual(1, queue.count)
    }
    
    func testQueueCountWithMultipleElementWithoutManipulation() {
        var queue = QueueWithTwoStacks<Int>()
        
        queue.append(item: 100)
        queue.append(item: 110)
        queue.append(item: 120)
        
        XCTAssertEqual(3, queue.count)
    }
    
    func testQueueCountWithMultipleElementWithManipulation() {
        var queue = QueueWithTwoStacks<Int>()
        
        queue.append(item: 100)
        XCTAssertEqual(1, queue.count)
        queue.append(item: 110)
        XCTAssertEqual(2, queue.count)
        queue.append(item: 120)
        XCTAssertEqual(3, queue.count)
        
        let _ = queue.pop()
        
        XCTAssertEqual(2, queue.count)
        
        queue.append(item: 130)
        XCTAssertEqual(3, queue.count)
        
        let _ = queue.pop()
        let _ = queue.pop()
        let _ = queue.pop()
        
        XCTAssertEqual(0, queue.count)
    }
    
    // MARK: - deleteFirst() tests
    func testDeleteFirstSimple() {
        var queue = QueueWithTwoStacks<Int>()
        
        queue.append(item: 1)
        queue.append(item: 2)
        queue.append(item: 3)
        
        queue.deleteFirst()
        
        XCTAssertEqual(2, queue.pop())
        XCTAssertEqual(3, queue.pop())
        XCTAssertEqual(nil, queue.pop())
    }
    
    func testDeleteFirstComplex() {
        var queue = QueueWithTwoStacks<Int>() // []
        
        queue.append(item: 1) // [1]
        queue.append(item: 2) // [1, 2]
        queue.append(item: 3) // [1, 2, 3]
        
        XCTAssertEqual(1, queue.pop()) // [2, 3]
        queue.deleteFirst() // [3]
        queue.append(item: 4) // [3, 4]
        queue.append(item: 5) // [3, 4, 5]
        
        XCTAssertEqual(3, queue.pop()) // [4, 5]
        queue.deleteFirst() // [5]
        XCTAssertEqual(5, queue.pop()) // []
    }
    
    // MARK: - deleteLast() tests
    func testDeleteLastSimple() {
        var queue = QueueWithTwoStacks<Int>()
        
        queue.append(item: 1)
        queue.append(item: 2)
        queue.append(item: 3)
        
        queue.deleteLast()
        
        XCTAssertEqual(1, queue.pop())
        XCTAssertEqual(2, queue.pop())
        XCTAssertEqual(nil, queue.pop())
    }
    
    func testDeleteLastComplex() {
        var queue = QueueWithTwoStacks<Int>() // []
        
        queue.append(item: 1) // [1]
        queue.append(item: 2) // [1, 2]
        queue.append(item: 3) // [1, 2, 3]
        
        XCTAssertEqual(1, queue.pop()) // [2, 3]
        queue.deleteLast() // [2]
        queue.append(item: 4) // [2, 4]
        queue.append(item: 5) // [2, 4, 5]
        
        XCTAssertEqual(2, queue.pop()) // [4, 5]
        queue.deleteLast() // [4]
        XCTAssertEqual(4, queue.pop()) // []
    }
    
    // MARK: - prepend() tests
    func testPrepend() {
        var queue = QueueWithTwoStacks<Int>() // []
        
        queue.append(item: 1) // [1]
        queue.append(item: 2) // [1, 2]
        queue.append(item: 3) // [1, 2, 3]
        queue.prepend(item: 4) // [4, 1, 2, 3]
        
        XCTAssertEqual(4, queue.pop()) // [1, 2, 3]
        XCTAssertEqual(1, queue.pop()) // [2, 3]
        
        queue.prepend(item: 5) // [5, 2, 3]
        queue.append(item: 6) // [5, 2, 3, 6]
        
        XCTAssertEqual(5, queue.pop()) // [2, 3, 6]
        XCTAssertEqual(2, queue.pop()) // [3, 6]
        XCTAssertEqual(3, queue.pop()) // [6]
        XCTAssertEqual(6, queue.pop()) // []
        XCTAssertEqual(nil, queue.pop())
    }
}
