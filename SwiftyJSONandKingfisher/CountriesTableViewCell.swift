//
//  CountriesTableViewCell.swift
//  SwiftyJSONandKingfisher
//
//  Created by Sridatta Nallamilli on 23/12/19.
//  Copyright © 2019 Sridatta Nallamilli. All rights reserved.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {

    @IBOutlet weak var cName: UILabel!
    @IBOutlet weak var cAlphaTwo: UILabel!
    @IBOutlet weak var imgFlag: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
