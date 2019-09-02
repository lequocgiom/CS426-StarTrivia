//
//  BlackBgView.swift
//  StarTrivia
//
//  Created by Le Trung on 8/16/19.
//  Copyright © 2019 Le Trung. All rights reserved.
//

import UIKit

class BlackBgView: UIView {
    
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
    
}

class BlackBgButton: UIButton {
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
}
