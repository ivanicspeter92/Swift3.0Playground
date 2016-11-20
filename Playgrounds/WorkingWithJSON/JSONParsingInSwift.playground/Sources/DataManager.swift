//
//  DataManager.swift
//  TopApps
//
//  Created by Attila on 2015. 11. 10..
//  Copyright © 2015. -. All rights reserved.
//

import Foundation

public class DataManager {
  
  public class func getTopAppsDataFromFileWithSuccess(_ success: @escaping ((_ data: Data) -> Void)) {
    DispatchQueue.global().async(execute: {
      let filePath = Bundle.main.path(forResource: "topapps", ofType:"json")
      let data = try! NSData(contentsOfFile:filePath!,
        options: NSData.ReadingOptions.uncached)
      success(data as Data)
    })
  }
  
  public class func loadDataFromURL(_ url: URL, completion:@escaping (_ data: Data?, _ error: NSError?) -> Void) {
    let session = URLSession.shared
    
    let loadDataTask = session.dataTask(with: url as URL) { (data, response, error) -> Void in
      if let responseError = error {
        completion(nil, responseError as NSError?)
      } else if let httpResponse = response as? HTTPURLResponse {
        if httpResponse.statusCode != 200 {
          let statusError = NSError(domain:"com.raywenderlich", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
          completion(nil, statusError)
        } else {
          completion(data, nil)
        }
      }
    }
    
    loadDataTask.resume()
  }
}
