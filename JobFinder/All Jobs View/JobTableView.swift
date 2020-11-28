//
//  JobTableView.swift
//  JobFinder
//
//  Created by Josh Arnold on 11/26/20.
//

import Foundation
import UIKit
import SnapKit


class JobTableView : UITableView {
    
    var identifier:String = "cell"
    
    
    init(reuseIdentifier:String = "cell") {
        super.init(frame: .zero, style: .plain)
        self.identifier = reuseIdentifier
        self.register(JobCell.self, forCellReuseIdentifier: reuseIdentifier)
        self.separatorStyle = .none
        self.alwaysBounceVertical = true
        self.showsVerticalScrollIndicator = false
        self.delaysContentTouches = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }        
}


