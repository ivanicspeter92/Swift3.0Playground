public struct Diagram {
    var items: [Drawable] = [];
    
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

