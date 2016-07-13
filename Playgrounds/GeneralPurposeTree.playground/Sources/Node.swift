public class Node<T> {
    // MARK: - Variables
    public private(set) var value: T;
    public private(set) var children = [Node<T>]();
    public private(set) var parent: Node?;
    
    // MARK: - Initializers
    public init(value: T) {
        self.value = value;
    }
    
    // MARK: - Functions
    public func addChild(node: Node<T>) {
        self.children.append(node);
        node.parent = self;
    }
    
    public func addChild(nodes: [Node<T>]) {
        for node in nodes {
            self.addChild(node: node);
        }
    }
}
