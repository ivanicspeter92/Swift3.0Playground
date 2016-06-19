extension Diagram: Drawable {
    func draw() {
        for item in self.items {
            item.draw();
        }
    }
}
