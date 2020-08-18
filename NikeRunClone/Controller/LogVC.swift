//
//  SecondViewController.swift
//  NikeRunClone
//
//  Created by Roman Tuzhilkin on 8/14/20.
//  Copyright © 2020 Roman Tuzhilkin. All rights reserved.
//

import UIKit

class LogVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var passedPace: String!
    var passedTime: String!
    var passedDistance: String!
    var passedDate: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension LogVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CONSTANTS.instance.tableCellIdentifier) as? LogTableViewCell else { return UITableViewCell() }
        cell.configureCell(forPace: "Pace", forTime: "Time", forDistance: "Distance", forDate: "Date")
        
        return cell
    }
    
    
}
