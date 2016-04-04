//
//  Banner.swift
//  harness2.0
//
//  Created by Mir Ali on 3/12/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import UIKit

class Banner: UIView {

    @IBOutlet weak var backgroundImage:UIImageView!
    @IBOutlet weak var logo:UILabel!

    override func awakeFromNib() {
        backgroundImage.clipsToBounds = true
        //personalize logo here
    }

}
