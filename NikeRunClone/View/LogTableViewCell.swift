//
//  LogCellViewTableViewCell.swift
//  NikeRunClone
//
//  Created by Roman Tuzhilkin on 8/17/20.
//  Copyright © 2020 Roman Tuzhilkin. All rights reserved.
//

import UIKit

class LogTableViewCell: UITableViewCell {

    @IBOutlet weak var paceLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var distanceLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    func configureCell(forPace paceStr: String, forTime timeStr: String, forDistance distanceStr: String, forDate dateStr: String){
        self.paceLbl.text = paceStr
        self.timeLbl.text = timeStr
        self.distanceLbl.text = distanceStr
        self.dateLbl.text = dateStr
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
