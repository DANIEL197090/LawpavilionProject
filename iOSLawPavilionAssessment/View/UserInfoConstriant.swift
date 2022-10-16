//
//  UserInfoConstriant.swift
//  iOSLawPavilionAssessment
//
//  Created by iOSApp on 16/10/2022.
//

import UIKit
extension userInfoViewController {
    func layoutView(){
        view.addSubview(avatarImage)
        view.addSubview(loginNamelabel)
        view.addSubview(typelabel)
      
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            avatarImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            avatarImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            avatarImage.heightAnchor.constraint(equalToConstant: 350),
            
            loginNamelabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 20),
            loginNamelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            typelabel.topAnchor.constraint(equalTo: loginNamelabel.bottomAnchor, constant: 20),
            typelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
