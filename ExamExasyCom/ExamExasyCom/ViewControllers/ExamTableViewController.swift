//
//  ExamTableViewController.swift
//  ExamExasyCom
//
//  Created by Ryan E on 8/27/22.
//

import UIKit
import SwiftyJSON

class ExamTableViewController: UITableViewController {

    private var dataList: [DataList]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set title of the viewcontroller's navigation bar
        self.title = "Exam"
        
        // Get the DataList from APi and Parse it and Reload the tableview
        self.getDataList()
    }

    func getDataList(){
        NetworkWorker.GET(urlString: API.ApiData.endpoint, token: nil) { data, response, error in
            DispatchQueue.main.async {
                Parser().parseDataList(data: data) { [weak self] (data) in
                    self?.dataList = data
                    DispatchQueue.main.async {
                        DispatchQueue.main.async {
                            self?.tableView.reloadData()
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.dataList?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell : ExamTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ExamTableViewCell") as! ExamTableViewCell
        
        // Configure the cell...
        cell.setData(data: dataList?[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "ExamDetailViewController") as! ExamDetailViewController
        detailViewController.setData(data: dataList?[indexPath.row])
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
