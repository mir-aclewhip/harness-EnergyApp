//
//  EnergyTypeCell.swift
//  harness2.0
//
//  Created by Mir Ali on 3/11/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import UIKit

class EnergyTypeCell: UIView {

    @IBOutlet weak var backgroundImage:UIImageView!
    @IBOutlet weak var button:UIButton!

    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
    }

}
