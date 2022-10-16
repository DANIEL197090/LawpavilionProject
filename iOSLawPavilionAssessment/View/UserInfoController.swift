//
//  UserInfoController.swift
//  iOSLawPavilionAssessment
//
//  Created by iOSApp on 16/10/2022.
//

import UIKit
import Kingfisher
class userInfoViewController: UIViewController{
    var avatar = ""
    var login = ""
    var type = ""
    lazy var avatarImage: UIImageView  = {
        let image = UIImageView.imageDesign()
        image.layer.cornerRadius = 0
        return image
    }()
    lazy var loginNamelabel: UILabel = {
        let label = UILabel.simpleBoldDesign()
        return label
    }()
    lazy var typelabel: UILabel = {
        let label = UILabel.simpleDesign()
        return label
    }()
    func displayInfo(){
        avatarImage.kf.setImage(with: URL(string: "\(avatar)"))
        loginNamelabel.text = login.localizedCapitalized
        typelabel.text = type
    }
    override func viewDidLoad() {
        layoutView()
        view.backgroundColor = systemColor
        displayInfo()
    }
    // MARK: - SETTING CELL TO INDEX OF 1
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
      self.navigationItem.setHidesBackButton(false, animated: true)
    }
}

