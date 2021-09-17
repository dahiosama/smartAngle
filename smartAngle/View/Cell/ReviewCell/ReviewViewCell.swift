//
//  ReviewViewCell.swift
//  smartAngle
//
//  Created by osama abu dahi on 17/09/2021.
//

import UIKit

class ReviewViewCell: UITableViewCell {

    @IBOutlet weak var descrption: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var bakgroundCellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.bakgroundCellView?.layer.cornerRadius = 25
        userImage.layer.cornerRadius = 16
//        self.b
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
