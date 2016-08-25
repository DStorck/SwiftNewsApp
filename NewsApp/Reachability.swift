//
//  Reachability.swift
//  NewsApp
//
//  Created by Deirdre Storck on 8/24/16.
//  Copyright © 2016 Deirdre Storck. All rights reserved.
//

import Foundation

public class Reachability {
    
    class func isConnectedToNetwork()->Bool{
        
        var stat:Bool = false
        let url = NSURL(string: "http://google.com/")
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "HEAD"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 7.0
        let session = NSURLSession.sharedSession()
        
        session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
            
            if let httpResponse = response as? NSHTTPURLResponse {
                print("httpResponse.statusCode \(httpResponse.statusCode)")
                if httpResponse.statusCode == 200 {
                    stat = true
                    print("the status code was 200 stat: \(stat)")
                }
            }
            
        }).resume()
    
        print ("status : \(stat)")
        
        return stat
    }
}