//
//  Service.swift
//  Platform
//
//  Created by Sumra Aarif on 2019/11/25.
//  Copyright © 2019 Sumra Aarif. All rights reserved.
//

import Foundation
import Domain

enum NetworkError: Error { // Use URLError ?
    case underlyingError(Error)
    case badResponse
    case badBaseURL
    case badURL
}

public protocol Networking: class {
    func submit(_ request: URLRequest, completion: @escaping (Data) -> Void)
}

public class Network: Networking {
        
    let session: URLSession!
    
    public init(_ session: URLSession? = nil) {
        self.session = session ?? URLSession.shared
    }
    
    public func submit(_ request: URLRequest, completion: @escaping (Data) -> Void) {
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                self.handleNetworkError(.underlyingError(error!))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                let error = URLError(.badServerResponse)
                self.handleNetworkError(.underlyingError(error))
                return
            }
            completion(data)
        }
        task.resume()
    }
}

private extension Network {
    
    func handleNetworkError(_ error: NetworkError) {
        print(error.localizedDescription)
    }
}

