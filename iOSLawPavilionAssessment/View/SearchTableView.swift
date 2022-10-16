//
//  ExtensionSearchViewController.swift
//  iOSLawPavilionAssessment
//
//  Created by iOSApp on 15/10/2022.
//

import UIKit
import Kingfisher
extension SearchViewController :UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getSearchResultViewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = userTableView.dequeueReusableCell(withIdentifier: UserCell.identifier, for: indexPath) as? UserCell else { return UITableViewCell() }
        cell.backgroundColor = systemColor
        cell.typelabel.text = getSearchResultViewModel.typeCellForRowsAt(indexPath: indexPath)
        cell.loginNamelabel.text = getSearchResultViewModel.loginCellForRowsAt(indexPath: indexPath)
        cell.avatarImageView.kf.setImage(with: URL(string: "\(getSearchResultViewModel.avatarCellForRowsAt(indexPath: indexPath))"))
        cell.layer.cornerRadius = 5
        return cell
    }
}
