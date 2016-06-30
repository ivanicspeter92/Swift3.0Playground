//: Playground - noun: a place where people can play
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

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
        guard let parser = AppJSONParser(with: json),
            let app = parser.getFirstApp(),
            let name = parser.getName(of: app),
            let link = parser.getLink(of: app)
            else { PlaygroundPage.current.finishExecution() }
        
        let entry = App(name: name, link: link)
        print(entry)
        PlaygroundPage.current.finishExecution()
    }
}

