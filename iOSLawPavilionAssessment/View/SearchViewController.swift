//
//  ViewController.swift
//  iOSLawPavilionAssessment
//
//  Created by iOSApp on 15/10/2022.
//

import UIKit
class SearchViewController: UIViewController, GetSearchResultViewModelDelegate {
    var username = "Daniel"
    var getSearchResultViewModel = GetSearchResultViewModel()
    lazy var searchTextField: paddedTextField = {
        let textField = paddedTextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Search a User",
            attributes: [NSAttributedString.Key.foregroundColor: AppColors.placeholderColor.color]
        )
        textField.layer.borderColor = AppColors.greenColor.color.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 5
        textField.backgroundColor = systemColor
        textField.font = UIFont(name: "HelveticaNeue-Regular", size: 14)
        textField.textColor = textSystemColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    lazy var filterButton: UIButton = {
        let button = UIButton()
       button.addTarget(self, action: #selector(didTapOnSearch), for: .touchUpInside)
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.backgroundColor = AppColors.greenColor.color
        button.tintColor = AppColors.white.color
        button.titleLabel?.font = UIFont(name: "Search", size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func didTapOnSearch() {
        guard let username = searchTextField.text else { return }
        if searchTextField.text != "" {
            userTableView.isHidden = true
            loadingView.isHidden = false
            loadingIndicatorView.isHidden = false
            getSearchResultViewModel.getSearchResult(username: username) {
                DispatchQueue.main.async {
                    self.userTableView.reloadData()
                }
            }
        }
    }
    lazy var userTableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = systemColor
        table.rowHeight = 80
        table.separatorStyle = .singleLine
        table.delegate = self
        table.dataSource = self
        return table
    }()
    lazy var loadingView: UIView  = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.isHidden = true
        view.backgroundColor = systemColor
        return view
    }()
    lazy var loadingIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.color = systemColor
        view.startAnimating()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        view.startAnimating()
        return view
    }()
    // MARK: -REGISTERING CELL ON THE DASHBOARD
    func registerAllCells(){
        userTableView.register(UserCell.self, forCellReuseIdentifier: UserCell.identifier)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = systemColor
        registerAllCells()
        layoutView()
        getSearchResultViewModel.delegate = self
        getSearchResultViewModel.getSearchResult(username: username) { [weak self] in
            DispatchQueue.main.async {
                self?.userTableView.reloadData()
            }
        }
    }
    func didReceiveGetSearchResultResponse(getSearchResultResponse: GetSearchResultResponse?, statusCode: Int) {}
}

