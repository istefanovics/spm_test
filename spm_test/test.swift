//
//  test.swift
//  spm_test
//
//  Created by István Stefánovics on 2022. 05. 11..
//

import Foundation

public class TestClass {
    public init() {}
    
    public func testCall(completion: @escaping (String) -> ()?) {
        testCallInternal { result in
            completion(result)
        }
    }
}
