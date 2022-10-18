//
//  iOSLawPavilionAssessmentTests.swift
//  iOSLawPavilionAssessmentTests
//
//  Created by iOSApp on 18/10/2022.
//

import XCTest
@testable import iOSLawPavilionAssessment
class iOSLawPavilionAssessmentTests: XCTestCase {
    let searchViewController = SearchViewController()
    let response = GetSearchResultResponse(total_count: 10, incomplete_results: true, items: [])
    let viewModel = GetSearchResultViewModel()
    let app = SearchViewController()
    //To test if my TableView is Instantiated
    func testInitPostTableView(){
        XCTAssertNotNil(searchViewController.userTableView)
    }
    
    //    To test if my tableview dataSource is not nill
    func testPostTableViewDataSource(){
        XCTAssertNotNil(searchViewController.userTableView.dataSource)
    }
    //    To test if my tableview delegate is not nill
    func testPostTableViewDelegate(){
        XCTAssertNotNil(searchViewController.userTableView.delegate)
    }
    // To test response model
    func testApiResponse() {
        XCTAssertNotNil(response)
    }
    // To test testfield
    func testTextfield() {
        XCTAssertEqual(searchViewController.searchTextField.text, "")
    }
    //To test if my datasource and delegate is from the same Instance
    func testIfDataSourceAndDelegateSameInstance(){
    XCTAssertEqual(searchViewController.userTableView.dataSource as! SearchViewController, searchViewController.userTableView.dataSource as! SearchViewController, "Error: Datasource and Delegate are not from the same instance")
        }
    //To test the view model
    func testViewModel(){
        let result: () = viewModel.getSearchResult(username: "dan", page: 3 , perPage: 3, completion: {})
        XCTAssertNotNil(result)
        }
    }
