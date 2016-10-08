//
//  QueueWithTwoStacks.swift
//  QueueWithTwoStacks
//
//  Created by Peter Ivanics on 20/09/16.
//  Copyright © 2016 Peter Ivanics. All rights reserved.
//

public struct QueueWithTwoStacks<T> {
    private var left = Stack<T>(), right = Stack<T>()
    
    public var count: Int {
        return self.left.count + self.right.count
    }
    
    /// Adds an item to the end of the queue.
    ///
    /// - parameter item: The item to be appended.
    mutating func append(item: T) {
        self.left.push(item);
    }
    
    
    /// Adds an item to the beginning of the queue.
    ///
    /// - parameter item: The item to be prepended.
    mutating func prepend(item: T) {
        self.right.push(item)
    }
    
    /// Pops an item from the beginning of the queue. The item is removed from the queue.
    ///
    /// - returns: The first item in the queue.
    mutating func pop() -> T? {
        if self.right.isEmpty {
            self.rotateLeftToRight()
        }
        
        return right.pop();
    }
    
    /// Deletes the first item from the queue.
    mutating func deleteFirst() {
        let _ = self.pop()
    }
    
    /// Deletes the last item from the queue.
    mutating func deleteLast() {
        if self.right.isEmpty == false {
            self.rotateRightToLeft()
        }
        let _ = self.left.pop()
    }
    
    // MARK: - Private functions
    private mutating func rotateLeftToRight() {
        while let nextElement = left.pop() {
            self.right.push(nextElement);
        }
    }
    
    private mutating func rotateRightToLeft() {
        while let nextElement = right.pop() {
            self.left.push(nextElement);
        }
    }
}
