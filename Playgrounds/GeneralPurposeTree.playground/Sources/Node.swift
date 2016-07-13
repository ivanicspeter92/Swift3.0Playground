public class Node {
    // MARK: - Variables
    public private(set) var value: String;
    public private(set) var children = [Node]();
    public private(set) var parent: Node?;
    
    // MARK: - Initializers
    public init(value: String) {
        self.value = value;
    }
    
    // MARK: - Functions
    public func addChild(node: Node) {
        self.children.append(node);
        node.parent = self;
    }
    
    public func addChild(nodes: [Node]) {
        for node in nodes {
            self.addChild(node: node);
        }
    }
}
