//: Playground - noun: a place where people can play
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
typealias Payload = [String: AnyObject]

func getJsonContents(from data: Data) -> Payload? {
    do {
        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as? Payload
        return json;
    } catch {
        print(error)
        return nil;
    }
}

func getFeed(from json: Payload) -> Payload? {
    let feed = json["feed"] as? Payload
    
    return feed
}

func getApps(from feed: Payload) -> [AnyObject]? {
    let apps = feed["entry"] as? [AnyObject]
    
    return apps
}

func getFirstApp(from feed: Payload) -> Payload? {
    if let apps = getApps(from: feed) {
        return getFirstApp(from: apps);
    }
    return nil;
}

func getFirstApp(from apps: [AnyObject]) -> Payload? {
    let firstApp = apps.first as? Payload
    
    return firstApp;
}

func getName(of app: Payload) -> String? {
    return (app["im:name"] as? Payload)?["label"] as? String
}

func getLink(of app: Payload) -> String? {
    return (app["id"] as? Payload)?["label"] as? String
}

DataManager.getTopAppsDataFromFileWithSuccess { (data) -> Void in
    if let json = getJsonContents(from: data) {
        guard let feed = getFeed(from: json),
            let app = getFirstApp(from: feed),
            let name = getName(of: app),
            let link = getLink(of: app)
            else { PlaygroundPage.current.finishExecution() }
        
        let entry = App(name: name, link: link)
        print(entry)
        PlaygroundPage.current.finishExecution()
    }
}

