import Foundation

extension Date: JSONRepresentable {
    public var JSONRepresentation: AnyObject {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        
        return formatter.string(from: self)
    }
}
