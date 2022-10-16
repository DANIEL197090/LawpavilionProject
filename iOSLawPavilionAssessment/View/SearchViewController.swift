//
//  ViewController.swift
//  iOSLawPavilionAssessment
//
//  Created by iOSApp on 15/10/2022.
//

import UIKit
class SearchViewController: UIViewController, GetSearchResultViewModelDelegate {
    var defaultUser = "Daniel"
    let spinner = UIActivityIndicatorView(style: .medium)
    var fetchMore = false
    var perPage = 10
    var page = 1
    var getSearchResultViewModel = GetSearchResultViewModel()
    lazy var searchTextField: paddedTextField = {
        let textField = paddedTextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Search a user",
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
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    lazy var searchResultlabel: UILabel = {
        let label = UILabel.simpleBoldDesign()
        label.textColor = AppColors.greenColor.color
        label.font = UIFont(name: "HelveticaNeue-Regular", size: 11)
        return label
    }()
    @objc func didTapOnSearch() {
        guard let username = searchTextField.text else { return }
        if username != "" {
            userTableView.isHidden = true
            loadingView.isHidden = false
            loadingIndicatorView.isHidden = false
            searchResultlabel.isHidden = true
            searchResultlabel.text = "Search result for : \(username)"
            getSearchResultViewModel.getSearchResult(username: username, page: page, perPage: perPage) {
                DispatchQueue.main.async { [weak self] in
                    self?.userTableView.isHidden = false
                    self?.loadingView.isHidden = true
                    self?.loadingIndicatorView.isHidden = true
                    self?.searchResultlabel.isHidden = false
                    self?.userTableView.reloadData()
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
        view.color = textSystemColor
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
    // MARK: - VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = systemColor
        hideKeyboardWhenTappedAround()
        searchResultlabel.text = "Search result for : \(defaultUser)"
        registerAllCells()
        layoutView()
        getSearchResultViewModel.delegate = self
        getSearchResultViewModel.getSearchResult(username: defaultUser, page: page, perPage: perPage) { [weak self] in
            DispatchQueue.main.async {
                self?.userTableView.reloadData()
            }
        }
        self.navigationController?.isNavigationBarHidden = true
    }
    func footerLoader() {
        spinner.color = textSystemColor
        spinner.hidesWhenStopped = true
        userTableView.tableFooterView = spinner
    }
    // MARK: - BEGIN TO FETCH DETAILS
    func batchFetch(name: String) {
        if fetchMore {
            perPage += 10
            print(perPage)
            getSearchResultViewModel.getSearchResult(username: name, page: page, perPage: perPage) {
                DispatchQueue.main.async { [self] in
                    fetchMore = true
                    self.userTableView.reloadData()
                }
            }
        } else {
            fetchMore = true
            spinner.stopAnimating()
        }
    }
    func beginBatchFetch() {
        guard let username = searchTextField.text else {return}
        batchFetch(name: username)
    }
    func beginDefaultBatchFetch() {
        batchFetch(name: defaultUser)
    }
    func didReceiveGetSearchResultResponse(getSearchResultResponse: GetSearchResultResponse?, statusCode: Int) {
        if statusCode == 403 {
            spinner.stopAnimating()
        }
    }
    
}

