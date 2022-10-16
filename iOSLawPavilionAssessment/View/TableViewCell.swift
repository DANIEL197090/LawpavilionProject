//
//  CollectionCell.swift
//  iOSLawPavilionAssessment
//
//  Created by iOSApp on 15/10/2022.
//
import UIKit
class UserCell: UITableViewCell  {
    static var identifier: String = "UserCellId"
    lazy var avatarImageView :  UIImageView  = {
        let profileImageView =  UIImageView()
        profileImageView.image = UIImage(named: "car")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.isUserInteractionEnabled = true
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 25
        return profileImageView
    }()
    
    lazy var typelabel: UILabel = {
        let label = UILabel()
        label.text = "Daniel"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.backgroundColor = AppColors.lightGreenColor.color
        label.textColor = AppColors.greenColor.color
        label.font = UIFont(name: "HelveticaNeue-Regular", size: 12)
        label.layer.cornerRadius = 3
        label.layer.masksToBounds = true
        return label
    }()
    lazy var loginNamelabel: UILabel = {
        let label = UILabel()
        label.text = "Daniel"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = textSystemColor
        label.font = UIFont(name: "HelveticaNeue-Regular", size: 16)
        return label
    }()
    // MARK: - ... Adding subviews and constraints in the cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(avatarImageView)
        addSubview(typelabel)
        addSubview(loginNamelabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            
            loginNamelabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            loginNamelabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            loginNamelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            typelabel.topAnchor.constraint(equalTo: loginNamelabel.bottomAnchor, constant: 5),
            typelabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            
            
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var frame: CGRect {
            get {
                return super.frame
            }
            set (newFrame) {
                var frame = newFrame
                let newWidth = frame.width * 0.90 // get 80% width here
                let space = (frame.width - newWidth) / 2
                frame.size.width = newWidth
                frame.origin.x += space

                super.frame = frame

            }
        }

}
