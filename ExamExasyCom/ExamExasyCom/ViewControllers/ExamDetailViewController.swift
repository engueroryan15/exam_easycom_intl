//
//  ExamDetailViewController.swift
//  ExamExasyCom
//
//  Created by Ryan E on 8/27/22.
//

import UIKit

class ExamDetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet var lblDescription: UILabel! = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setData(data: DataList?){
        self.title = "ID: \(data?.id ?? 0)"
        DispatchQueue.main.async {
            self.lblDescription.text = "\(data?.title ?? "")"
            NetworkWorker.GET(urlString: data?.url ?? "", token: nil) { data, response, error in
                self.detailImageView.image = UIImage(data: data!, scale:1)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
