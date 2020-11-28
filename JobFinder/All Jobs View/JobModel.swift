//
//  JobModel.swift
//  JobFinder
//
//  Created by Josh Arnold on 11/26/20.
//

import Foundation


struct Job : Decodable {
    var title:String
    var company:String
    var imageURL:String
    var location:String
    var date:String
    var description:String
}
