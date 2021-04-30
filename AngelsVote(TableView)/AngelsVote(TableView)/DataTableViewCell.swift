//
//  DataTableViewCell.swift
//  AngelsVote(TableView)
//
//  Created by Alper Yorgun on 29.04.2021.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var lbltext: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
