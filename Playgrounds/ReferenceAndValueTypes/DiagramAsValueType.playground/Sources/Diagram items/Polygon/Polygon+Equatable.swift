extension Polygon: Equatable {
}

public func ==(lbs: Polygon, rbs: Polygon) -> Bool {
    return lbs.corners == rbs.corners;
}
