extension Diagram: Drawable {
    public func draw() {
        for item in self.items {
            item.draw();
        }
    }
}
