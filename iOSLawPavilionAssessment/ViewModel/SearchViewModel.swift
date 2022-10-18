//
//  SearchViewModel.swift
//  iOSLawPavilionAssessment
//
//  Created by iOSApp on 16/10/2022.
//

import Foundation
protocol GetSearchResultViewModelDelegate {
    func didReceiveGetSearchResultResponse(getSearchResultResponse: GetSearchResultResponse?, statusCode: Int)
}
class GetSearchResultViewModel {
    var delegate: GetSearchResultViewModelDelegate?
    private var userDetails:[UsersDetails] = []
    func getSearchResult(username: String,page: Int,perPage: Int, completion: @escaping () -> Void) {
        userDetails.removeAll()
        let searchResultResource = GetSearchResultResource()
        searchResultResource.getSearchResult(username: username, page: page, perPage: perPage) { getSearchResult, statusCode in
            if statusCode == 200 {
                DispatchQueue.main.async { [weak self] in
                    self?.delegate?.didReceiveGetSearchResultResponse(getSearchResultResponse: getSearchResult, statusCode: statusCode)
                    guard let searchResult = getSearchResult?.items else {
                        return
                    }
                    guard let totalCount = getSearchResult?.total_count else {
                        return
                    }
                    Utility.savePageCount(number: totalCount)
                    print(Utility.getPagesCount())
                    for index in 0..<searchResult.count {
                        let avatarImage = searchResult[index].avatar_url
                        let loginName = searchResult[index].login
                        let typeName = searchResult[index].type
                        self?.userDetails.append(UsersDetails(avatar: avatarImage ?? "", login: loginName, userType: typeName ?? ""))
                        
                        // sorting the result uusing login
                        self?.userDetails =  self?.userDetails.sorted(by: {$0.login.localizedCapitalized < $1.login.localizedCapitalized}) ?? []
                    }
                    completion()
                }
            }
            if statusCode == 403 {
                self.delegate?.didReceiveGetSearchResultResponse(getSearchResultResponse: getSearchResult, statusCode: statusCode)
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return  userDetails.count
    }
    func cellForRowsAt(indexPath: IndexPath) -> [UsersDetails] {
        return userDetails
    }
}

