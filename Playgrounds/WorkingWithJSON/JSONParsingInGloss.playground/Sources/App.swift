public struct App: Decodable {
    public let name: String
    public let link: String
    
    public init(name: String, link: String) {
        self.name = name
        self.link = link
    }
    
    public init?(json: JSON) {
        guard let container: JSON = "im:name" <~~ json,
            let id: JSON = "id" <~~ json
            else { return nil }
        
        guard let name: String = "label" <~~ container,
            link: String = "label" <~~ id
            else { return nil }
        
        self.init(name: name, link: link);
    }
}
