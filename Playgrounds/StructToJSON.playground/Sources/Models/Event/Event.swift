import Foundation

public struct Event {
    var name: String
    var timestamp: Date
    
    public init(name: String) {
        self.init(name: name, timestamp: Date())
    }
    
    public init(name: String, timestamp: Date) {
        self.name = name;
        self.timestamp = timestamp;
    }
}
