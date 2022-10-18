//
//  SearchConstriants.swift
//  iOSLawPavilionAssessment
//
//  Created by iOSApp on 16/10/2022.
//

import UIKit
extension SearchViewController {
    func layoutView() {
        view.addSubview(searchTextField)
        view.addSubview(searchResultlabel)
        view.addSubview(searchButton)
        view.addSubview(userTableView)
        view.addSubview(loadingView)
        loadingView.addSubview(loadingIndicatorView)
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -85),
            searchTextField.heightAnchor.constraint(equalToConstant: 55),
            
            searchResultlabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
            searchResultlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        
            searchButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            searchButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 10),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchButton.heightAnchor.constraint(equalToConstant: 55),
            
            loadingView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 30),
            loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            loadingIndicatorView.topAnchor.constraint(equalTo: loadingView.topAnchor, constant: 50),
            loadingIndicatorView.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor, constant: 0),
            loadingIndicatorView.heightAnchor.constraint(equalToConstant: 100),
            
        ])
    userTableView.anchorWithConstantsToTop(searchButton.bottomAnchor,
                                                         left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
}
