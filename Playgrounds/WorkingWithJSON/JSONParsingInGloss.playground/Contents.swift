// Playground presenting how to parse JSON files using Gloss framework
// Source: https://www.raywenderlich.com/120442/swift-json-tutorial
// 
// Other references: https://github.com/hkellaway/Gloss
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
        guard let topApps = TopApps(json: json),
            let entry = topApps.feed?.entries?.first
            else { PlaygroundPage.current.finishExecution() }
        
        print(entry)
        PlaygroundPage.current.finishExecution()
    }
}

