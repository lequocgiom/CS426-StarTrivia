//
//  FadeEnableBtn.swift
//  StarTrivia
//
//  Created by Le Trung on 8/17/19.
//  Copyright © 2019 Le Trung. All rights reserved.
//

import UIKit

class FadeEnableBtn : UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.2){
                    self.alpha = 1.0
                }
            }
            else {
                UIView.animate(withDuration: 0.2){
                    self.alpha = 0.5
                }
            }
        }
    }
}
