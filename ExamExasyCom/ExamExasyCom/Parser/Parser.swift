//
//  Parser.swift
//  ExamExasyCom
//
//  Created by Ryan E on 8/27/22.
//

import UIKit
import SwiftyJSON

class Parser: NSObject {
    
    func parseDataList(data: Data?, completionHandler: @escaping ([DataList]) -> Void) {
            if let data = data,
             let userlist = try? JSONDecoder().decode([DataList].self, from: data) {
            completionHandler(userlist)
          }
      }
}
