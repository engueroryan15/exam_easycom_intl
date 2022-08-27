//
//  ExamTableViewCell.swift
//  ExamExasyCom
//
//  Created by Ryan E on 8/27/22.
//

import UIKit
import Foundation
import Alamofire

class ExamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dataImageView: UIImageView!
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.lblID.layer.cornerRadius = 10.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: DataList?){
        
        self.lblID?.text = "ID: \(data?.id ?? 0)"
        self.lblDescription?.text = data?.title
        
        NetworkWorker.GET(urlString: data?.thumbnailUrl ?? "", token: nil) { data, response, error in
            self.dataImageView.image = UIImage(data: data!, scale:1)
        }
    }
}
