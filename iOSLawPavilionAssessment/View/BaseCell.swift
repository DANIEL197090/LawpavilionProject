//
//  BaseCell.swift
//  iOSLawPavilionAssessment
//
//  Created by iOSApp on 15/10/2022.
//

import UIKit
class BaseCell : UICollectionViewCell {
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  func setupView() {
    
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
