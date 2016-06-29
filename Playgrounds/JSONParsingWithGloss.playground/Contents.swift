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

DataManager.getTopAppsDataFromFileWithSuccess { (data) -> Void in
    if let json = getJsonContents(from: data) {
        guard let feed = json["feed"] as? Payload,
            let apps = feed["entry"] as? [AnyObject],
            let app = apps.first as? Payload
            else { PlaygroundPage.current.finishExecution() }
        
        guard let container = app["im:name"] as? Payload,
            let name = container["label"] as? String
            else { PlaygroundPage.current.finishExecution() }
        
        guard let id = app["id"] as? Payload,
            let link = id["label"] as? String
            else { PlaygroundPage.current.finishExecution() }
        
        // 3
        let entry = App(name: name, link: link)
        print(entry)
        
        PlaygroundPage.current.finishExecution()
    }
}

