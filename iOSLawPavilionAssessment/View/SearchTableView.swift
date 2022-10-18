//
//  ExtensionSearchViewController.swift
//  iOSLawPavilionAssessment
//
//  Created by iOSApp on 15/10/2022.
//

import UIKit
import Kingfisher
extension SearchViewController {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getSearchResultViewModel.numberOfRowsInSection(section: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = userTableView.dequeueReusableCell(withIdentifier: UserCell.identifier, for: indexPath) as? UserCell else { return UITableViewCell() }
        cell.backgroundColor = systemColor
        cell.selectionStyle = .none
        cell.loginNamelabel.text = getSearchResultViewModel.cellForRowsAt(indexPath: indexPath)[indexPath.row].login.localizedCapitalized
        cell.avatarImageView.kf.setImage(with: URL(string: "\(getSearchResultViewModel.cellForRowsAt(indexPath: indexPath)[indexPath.row].avatar)"))
        cell.typelabel.text = getSearchResultViewModel.cellForRowsAt(indexPath: indexPath)[indexPath.row].userType
        cell.layer.cornerRadius = 5
        return cell
    }
    // MARK: - DID TAP ON CELL
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = userInfoViewController()
        viewController.avatar = getSearchResultViewModel.cellForRowsAt(indexPath: indexPath)[indexPath.row].avatar
        viewController.login =  getSearchResultViewModel.cellForRowsAt(indexPath: indexPath)[indexPath.row].login
        viewController.type = getSearchResultViewModel.cellForRowsAt(indexPath: indexPath)[indexPath.row].userType
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row ==  getSearchResultViewModel.numberOfRowsInSection(section: indexPath.section) - 1 {
            footerLoader()
            DispatchQueue.main.async { [self] in
                if Utility.getPagesCount() <= page {
                    spinner.stopAnimating()
                } else {
                    spinner.startAnimating()
                    if searchTextField.text != "" {
                        beginBatchFetch()
                    } else {
                      beginDefaultBatchFetch()
                    }
                   
            }
        }
    }
 }
}
