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
    func getSearchResult(username: String, completion: @escaping () -> Void) {
        let searchResultResource = GetSearchResultResource()
        searchResultResource.getSearchResult(username: username) { getSearchResult, statusCode in
            DispatchQueue.main.async { [weak self] in
                self?.delegate?.didReceiveGetSearchResultResponse(getSearchResultResponse: getSearchResult, statusCode: statusCode)
                guard let searchResult = getSearchResult?.items else {
                    return
                }
                guard let totalCount = getSearchResult?.total_count else {
                    return
                }
                Utility.savePageCount(number: totalCount)
                for index in 0..<searchResult.count {
                    let avatarImage = searchResult[index].avatar_url
                    let loginName = searchResult[index].login
                    let typeName = searchResult[index].type
                    self?.userDetails.append(UsersDetails(avatar: avatarImage ?? "", login: loginName, userType: typeName))
                }
                completion()
            }
        }
    }
    func numberOfRowsInSection(section: Int) -> Int {
        return  userDetails.count
    }
    func avatarCellForRowsAt(indexPath: IndexPath) -> String {
        return userDetails[indexPath.row].avatar
    }
    func loginCellForRowsAt(indexPath: IndexPath) -> String {
        return userDetails[indexPath.row].login
    }
    func typeCellForRowsAt(indexPath: IndexPath) -> String {
        return userDetails[indexPath.row].userType
    }
}

