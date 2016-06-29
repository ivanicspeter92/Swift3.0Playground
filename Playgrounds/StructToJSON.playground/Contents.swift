let car = Car(manufacturer: "Tesla", model: "Model T", mileage: 1234.56, owner: Owner(name: "Emil"))
car.manufacturer

if let json = car.toJSON() {
    print(json)
}