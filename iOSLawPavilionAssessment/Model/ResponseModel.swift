//
//  ResponseModel.swift
//  iOSLawPavilionAssessment
//
//  Created by iOSApp on 16/10/2022.
//
import Foundation
struct GetSearchResultResponse: Codable {
    let total_count: Int
    let incomplete_results: Bool
    let items: [AllItems]
}
// MARK: - Result
struct AllItems: Codable {
    let login : String
    let avatar_url: String?
    let type: String?
}
