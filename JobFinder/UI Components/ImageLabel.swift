//
//  ImageLabel.swift
//  JobFinder
//
//  Created by Josh Arnold on 11/26/20.
//

import Foundation
import UIKit
import SnapKit


class ImageLabel : UIView {
    
    var imageView:UIImageView = UIImageView()
    var label:Label = Label()
    
    var imageName:String = ""
    {
        didSet {
            if let x = UIImage(named: imageName) {
                self.imageView.image = x
                    .withRenderingMode(.alwaysTemplate)
                    .withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -4))
            }
        }
    }
    
    var text:String = ""
    {
        didSet {
            self.label.text = text
        }
    }
    
    
    init() {
        super.init(frame: .zero)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        isOpaque = false
        
        imageView.tintColor = .primary
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        addSubview(label)
        
        imageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(18)
        }
        
        label.snp.makeConstraints { (make) in
            make.left.equalTo(self.imageView.snp.right)
            make.right.top.bottom.equalToSuperview()
        }
    }
}

