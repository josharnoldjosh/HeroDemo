//
//  JobCell.swift
//  JobFinder
//
//  Created by Josh Arnold on 11/26/20.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher


class JobCell : UITableViewCell {
    
    var companyImage:UIImageView!
    var title:Label!
    var company:ImageLabel!
    var location:ImageLabel!
    var date:Label!
    var line:UIView!
    var padding:UIView!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
        self.snap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func acceptJob(job:Job) {
        self.title.text = job.title
        self.company.imageName = "company"
        self.company.text = job.company
        self.location.text = job.location
        self.location.imageName = "location"
        self.date.text = job.date
        let url = URL(string: job.imageURL)
        companyImage.kf.setImage(with: url)
    }
    
    func updateHeroID(index:Int) {
        self.contentView.hero.id = "view" + String(index)
        self.title.hero.id = "title" + String(index)
        self.company.hero.id = "company" + String(index)
        self.location.hero.id = "location" + String(index)
        self.companyImage?.hero.id = "imageView" + String(index)
    }
}


extension JobCell {
    
    func setupUI() {
        
        let select = UIView()
        select.backgroundColor = .systemGray6
        self.selectedBackgroundView = select
        
        companyImage = UIImageView()
        companyImage.backgroundColor = .systemBackground
        companyImage.layer.cornerRadius = 8
        companyImage.contentMode = .scaleAspectFit
        companyImage.layer.masksToBounds = true
        contentView.addSubview(companyImage)
        
        title = Label()
        title.font = UIFont.title
        contentView.addSubview(title)
        
        company = ImageLabel()
        contentView.addSubview(company)
        
        location = ImageLabel()
        contentView.addSubview(location)
        
        date = Label()
        date.textColor = .systemGray4
        date.textAlignment = .right
        date.font = .detail
        contentView.addSubview(date)
        
        line = UIView()
        line.backgroundColor = .systemGray6
        contentView.addSubview(line)
        
        padding = UIView()
        contentView.addSubview(padding)
    }
    
    func snap() {
        companyImage.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().inset(10)
            make.width.height.equalTo(80)
        }
        
        title.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(10)
            make.left.equalTo(self.companyImage.snp.right).offset(10)
            make.height.lessThanOrEqualToSuperview()
            make.right.equalToSuperview().inset(65)
        }
        
        date.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(10)
            make.left.equalTo(self.title.snp.right)
            make.height.equalTo(self.title)
            make.right.equalToSuperview().inset(20)
        }
        
        company.snp.makeConstraints { (make) in
            make.top.equalTo(self.title.snp.bottom)
            make.left.equalTo(self.companyImage.snp.right).offset(10)
            make.height.lessThanOrEqualToSuperview()
            make.right.equalToSuperview().inset(10)
        }
        
        location.snp.makeConstraints { (make) in
            make.top.equalTo(self.company.snp.bottom)
            make.left.equalTo(self.companyImage.snp.right).offset(10)
            make.height.lessThanOrEqualToSuperview()
            make.right.equalToSuperview().inset(10)
        }
        
        line.snp.makeConstraints { (make) in
            make.top.equalTo(self.location.snp.bottom).offset(15)
            make.width.equalTo(120)
            make.height.equalTo(2)
            make.centerX.equalToSuperview()
        }
        
        padding.snp.makeConstraints { (make) in
            make.top.equalTo(self.line.snp.bottom)
            make.left.right.bottom.equalToSuperview().inset(10)
        }
    }
}
