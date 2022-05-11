//
//  internal.swift
//  spm_test
//
//  Created by István Stefánovics on 2022. 05. 11..
//

import Foundation
import Alamofire

func testCallInternal(completion: @escaping (String) -> ()?) {
    Alamofire.request(URL(string: "https://httpbin.org/get")!,
                      method: .get,
                      parameters: nil,
                      encoding: JSONEncoding.default,
                      headers: nil).responseJSON { response in
        if let result = response.result.value {
            let JSON = result as! NSDictionary
            
            completion(JSON["origin"] as! String)
        } else {
            completion("We are fucked!")
        }
    }
}