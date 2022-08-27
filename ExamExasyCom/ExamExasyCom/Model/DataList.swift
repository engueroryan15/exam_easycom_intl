//
//  DataList.swift
//  ExamExasyCom
//
//  Created by Ryan E on 8/27/22.
//

import Foundation

struct DataList: Codable
{
    var thumbnailUrl : String
    var id : Int
    var url : String
    var albumId : Int
    var title : String
    
    enum CodingKeys: String, CodingKey {
        case thumbnailUrl = "thumbnailUrl"
        case id
        case url = "url"
        case albumId
        case title = "title"
    }
}
