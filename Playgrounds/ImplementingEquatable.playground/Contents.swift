import Foundation

struct User {
    var id: Int;
    var username: String;
}

// the type has to conform to the Equatable protocol and implement the == function below
extension User: Equatable {
}

func ==(lhs: User, rhs: User) -> Bool {
    return lhs.id == rhs.id
}

var peter = User(id: 1, username: "Peter");
let joe = User(id: 2, username: "Joe");
peter == joe

peter.id = joe.id;
peter.username = joe.username;
peter == joe