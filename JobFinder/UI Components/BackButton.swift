//
//  NavigationBackButton.swift
//  JobFinder
//
//  Created by Josh Arnold on 11/27/20.
//

import Foundation
import UIKit


class BackButton: UIBarButtonItem {

    var button:UIButton! = UIButton()
    
    convenience init(imageName: String) {
        let barButton = UIButton(frame: .zero)
        let barButtonImage = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        barButton.setImage(barButtonImage, for: .normal)
        barButton.tintColor = UIColor.primary
        barButton.sizeToFit()
        barButton.isUserInteractionEnabled = true
        self.init(customView: barButton)
        self.button = barButton
    }

    private override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
