public struct Diagram {
    public var items: [Drawable] = [];
    
    public init(items: [Drawable]) {
        self.items = items;
    }
    
    mutating func add(item: Drawable) {
        self.items.append(item);
    }
}

//extension Diagram: Equatable {
//}
//
//public func ==(lbs: Diagram, rbs: Diagram) -> Bool {
//    return lbs.items == rbs.items;
//}

