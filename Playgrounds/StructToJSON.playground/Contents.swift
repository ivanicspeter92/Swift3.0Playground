// http://codelle.com/blog/2016/5/an-easy-way-to-convert-swift-structs-to-json/

let car = Car(manufacturer: "Tesla", model: "Model T", mileage: 1234.56, owner: Owner(name: "Emil"))

if let json = car.toJSON() {
    print(json)
}
