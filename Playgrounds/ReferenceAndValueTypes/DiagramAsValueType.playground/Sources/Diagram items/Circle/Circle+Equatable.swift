extension Circle: Equatable {
}

public func ==(lbs: Circle, rbs: Circle) -> Bool {
    return lbs.center == rbs.center && lbs.radius == rbs.radius;
}
