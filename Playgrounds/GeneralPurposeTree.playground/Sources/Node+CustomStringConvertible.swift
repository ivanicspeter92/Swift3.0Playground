extension Node: CustomStringConvertible {
    public var description: String {
        var text = "\(self.value)"
        
        if !self.children.isEmpty {
            text += " {" + self.children.map { $0.description }.joined(separator: ", ") + "} "
        }
        return text
    }
}
