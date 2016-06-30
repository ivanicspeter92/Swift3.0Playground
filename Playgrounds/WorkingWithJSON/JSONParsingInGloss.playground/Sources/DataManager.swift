//
//  DataManager.swift
//  TopApps
//
//  Created by Attila on 2015. 11. 10..
//  Copyright © 2015. -. All rights reserved.
//

import Foundation

public class DataManager {
    public class func getTopAppsDataFromFileWithSuccess(_ success: ((data: Data) -> Void)) {
        DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: {
            let filePath = Bundle.main().pathForResource("topapps", ofType:"json")
            let data = try! NSData(contentsOfFile:filePath!,
                                   options: NSData.ReadingOptions.dataReadingUncached)
            success(data: data as Data)
        })
    }
    
    public class func loadDataFromURL(_ url: URL, completion:(data: Data?, error: NSError?) -> Void) {
        let session = URLSession.shared()
        
        let loadDataTask = session.dataTask(with: url as URL) { (data, response, error) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    let statusError = NSError(domain:"com.raywenderlich", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    completion(data: data, error: nil)
                }
            }
        }
        
        loadDataTask.resume()
    }
}
