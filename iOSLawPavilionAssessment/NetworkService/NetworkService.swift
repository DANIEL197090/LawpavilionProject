//
//  NetworkService.swift
//  iOSLawPavilionAssessment
//
//  Created by iOSApp on 15/10/2022.
//
import Foundation
struct HTTPUtility {
    func getAPIDataWithStatusCode<T: Decodable>(requestURL: URL, resultType: T.Type, completion: @escaping (_ result: T?,_ statusCode: Int) -> Void) {
        var requestURL = URLRequest(url: requestURL, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalCacheData, timeoutInterval: 60)
        URLCache.shared.removeCachedResponse(for: requestURL)
        requestURL.httpMethod = "get"
        requestURL.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        requestURL.addValue("application/json", forHTTPHeaderField: "Accept")
        URLSession.shared.dataTask(with: requestURL) { (responseData, httpURLResponse, error) in
            guard let httpResponse  = httpURLResponse as? HTTPURLResponse else { return  }
            if (error == nil && responseData != nil && responseData?.count != 0) {
                let decoder = JSONDecoder()
                do {
                    if httpResponse.statusCode ==  200 {
                        let result = try decoder.decode(T.self, from: responseData!)
                        completion(result, httpResponse.statusCode)
                    }
                    if httpResponse.statusCode ==  403 {
                        let result = try decoder.decode(T.self, from: responseData!)
                        completion(result, httpResponse.statusCode)
                    }
                    if httpResponse.statusCode ==  503 {
                        let result = try decoder.decode(T.self, from: responseData!)
                        completion(result, httpResponse.statusCode)
                    }
                } catch let error{
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
