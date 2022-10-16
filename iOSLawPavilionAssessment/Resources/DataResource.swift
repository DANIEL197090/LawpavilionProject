//
//  DataResource.swift
//  iOSLawPavilionAssessment
//
//  Created by iOSApp on 15/10/2022.
//

import Foundation
struct GetSearchResultResource {
    func getSearchResult(username: String,page: Int,perPage: Int, completionHandler: @escaping (_ result: GetSearchResultResponse?,_ statusCode:Int) -> Void) {
        let httpUtility = HTTPUtility()
        let getSearchResultUrl = ApiEndpoints.userEndpoint + "?q=\(username)&page=\(page)&per_page=\(perPage)"
        let url = URL(string: getSearchResultUrl)!
        do {
            httpUtility.getAPIDataWithStatusCode(requestURL: url, resultType: GetSearchResultResponse.self) { result, statusCode in
                completionHandler(result,statusCode)
            }
        }
    }
}
struct Utility {
    static func savePageCount(number: Int) {
        UserDefaults.standard.setValue(number, forKey: "pageCount")
    }
    
    static func getPagesCount() -> Int {
        return UserDefaults.standard.integer(forKey: "pageCount")
    }
}
struct UsersDetails : Codable {
    var avatar: String
    var login: String
    var userType: String
}
