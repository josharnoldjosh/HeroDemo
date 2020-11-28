//
//  Label.swift
//  JobFinder
//
//  Created by Josh Arnold on 11/26/20.
//

import Foundation
import UIKit


class Label : UILabel {
    
    init() {
        super.init(frame: .zero)
        self.font = .label
        self.textColor = .primary
        self.numberOfLines = 0
        self.textAlignment = .left
        self.isOpaque = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
