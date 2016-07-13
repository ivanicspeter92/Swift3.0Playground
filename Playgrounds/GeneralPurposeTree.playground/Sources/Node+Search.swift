extension Node where T: Equatable {
    public func search(value: T) -> Node? {
        if value == self.value {
            return self;
        }
        
        for node in self.children {
            if let foundNode = node.search(value: value) {
                return foundNode
            }
        }
        
        return nil;
    }
}
