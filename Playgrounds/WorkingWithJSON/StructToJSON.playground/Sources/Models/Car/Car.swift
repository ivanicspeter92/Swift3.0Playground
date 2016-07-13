public struct Car {
    public var manufacturer: String
    public var model: String
    public var mileage: Float
    public var owner: Owner
    
    public init(manufacturer: String, model: String, mileage: Float, owner: Owner) {
        self.manufacturer = manufacturer
        self.model = model
        self.mileage = mileage
        self.owner = owner;
    }
}
