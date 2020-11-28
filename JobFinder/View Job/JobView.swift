//
//  JobView.swift
//  JobFinder
//
//  Created by Josh Arnold on 11/26/20.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher
import Hero


class JobView : UIScrollView {
    
    var job:Job!
    var superviewWidth:CGFloat!
    
    var imageView:UIImageView!
    var jobTitle:Label!
    var datePosted:Label!
    var company:ImageLabel!
    var location:ImageLabel!
    var desc:Label!
    
    var padding:UIView!
    
    
    init(job:Job, width:CGFloat) {
        super.init(frame: .zero)
        self.job = job
        self.superviewWidth = width
        self.setupUI()
        self.jobTitle.text = job.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension JobView {
    
    func setupUI() {
                        
        imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.kf.setImage(with: URL(string: self.job.imageURL))
        addSubview(imageView)
        
        jobTitle = Label()
        jobTitle.font = UIFont.largeTitle
        addSubview(jobTitle)
                
        company = ImageLabel()
        company.text = job.company
        company.imageName = "company"
        addSubview(company)
        
        location = ImageLabel()
        location.text = job.location
        location.imageName = "location"
        addSubview(location)
        
        desc = Label()
        desc.text = job.description
        desc.font = .desc
        desc.textColor = .systemGray        
        addSubview(desc)
    
        padding = UIView()
        addSubview(padding)
        
        imageView.snp.makeConstraints { (make) in
            let width:CGFloat = 60
            make.width.height.equalTo(width)
            make.top.equalToSuperview()
            make.left.equalToSuperview().inset((self.superviewWidth - width)/2)
        }
        
        jobTitle.snp.makeConstraints { (make) in
            make.top.equalTo(self.imageView.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(20)
            make.width.equalTo(self.superviewWidth-40)
            make.height.lessThanOrEqualToSuperview()
        }
        
        company.snp.makeConstraints { (make) in
            make.top.equalTo(self.jobTitle.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(20)
            make.width.equalTo(self.superviewWidth-40)
            make.height.lessThanOrEqualToSuperview()
        }
        
        location.snp.makeConstraints { (make) in
            make.top.equalTo(self.company.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(20)
            make.width.equalTo(self.superviewWidth-40)
            make.height.lessThanOrEqualToSuperview()
        }
        
        desc.snp.makeConstraints { (make) in
            make.top.equalTo(self.location.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(20)
            make.width.equalTo(self.superviewWidth-40)
            make.height.lessThanOrEqualToSuperview()
        }
        
        padding.snp.makeConstraints { (make) in
            make.top.equalTo(self.desc.snp.bottom).offset(20)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
