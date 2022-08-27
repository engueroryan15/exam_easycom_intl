//
//  ExamTableViewCell.swift
//  ExamExasyCom
//
//  Created by Ryan E on 8/27/22.
//

import UIKit

class ExamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
