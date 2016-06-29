import Foundation

public typealias Payload = [String: AnyObject]

public class AppJSONParser {
    // MARK: - Variables
    private let feed: Payload
    
    // MARK: - Initialziers
    public init?(with payload: Payload) {
        guard let feed = payload["feed"] as? Payload else { return nil }
        
        self.feed = feed;
    }
    
    // MARK: - Public functions
    public func getFirstApp() -> Payload? {
        if let apps = getApps(from: self.feed) {
            return getFirstApp(from: apps);
        }
        return nil;
    }
    
    public func getName(of app: Payload) -> String? {
        return (app["im:name"] as? Payload)?["label"] as? String
    }
    
    public func getLink(of app: Payload) -> String? {
        return (app["id"] as? Payload)?["label"] as? String
    }
    
    // MARK: - Private functions
    private func getApps(from feed: Payload) -> [AnyObject]? {
        let apps = feed["entry"] as? [AnyObject]
        
        return apps
    }
    
    private func getFirstApp(from apps: [AnyObject]) -> Payload? {
        let firstApp = apps.first as? Payload
        
        return firstApp;
    }
}
