// http://codelle.com/blog/2016/5/an-easy-way-to-convert-swift-structs-to-json/
import Foundation

let car = Car(manufacturer: "Tesla", model: "Model T", mileage: 1234.56, owner: Owner(name: "Emil"))
if let json = car.toJSON() {
    print(json)
}

let event = Event(name: "Something happened")
if let json = event.toJSON() {
    print(json)
}
