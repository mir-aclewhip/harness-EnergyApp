//
//  InfoViewController.swift
//  harness2.0
//
//  Created by Mir Ali on 3/12/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import UIKit

extension Double {
    /// Rounds the double to decimal places value
    func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(self * divisor) / divisor
    }
}

class InfoViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var efficiencyLabel: UILabel!
    @IBOutlet var costLabel: UILabel!
    @IBOutlet var bannerImage: UIImageView!
    @IBOutlet var efficiencyInfo: UILabel!
    @IBOutlet var costInfo: UILabel!
    @IBOutlet var kwhCostLabel:UILabel!
    
    var indexPath:Int!
    var titleString:String = ""
    var bannerImg:UIImage!
    var energyType:[String] = ["Wind","Geothermal", "Hydroelectric", "Nuclear", "Solar", "Biomass", "Natural Gas", "Coal"]
    var funFacts:[String]!
    var cost:[Int] = [4,6,8,3,5,7,2,1]
    var efficiencyArray:[Int] = [1164, 514, 317, 290, 207, 52, 38, 29]
    var costArray:[Double] = [97, 102, 86, 114, 211, 113, 66, 95]
    var currentImage:UIImage!

    let HEIGHT:CGFloat = 50
    let screenSize: CGRect = UIScreen.mainScreen().bounds

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        bannerImage.image = bannerImg
        
        var x = 1
        let screenWidth = screenSize.width - 70
        for fact in funFacts {
            
            let frame = CGRectMake(-screenWidth+(screenWidth * CGFloat(x)), 5, screenWidth, HEIGHT)
            let label = UILabel(frame: frame)
            
            //let leadingConstraint = NSLayoutConstraint(item: label, attribute: .Leading, relatedBy: .Equal, toItem: scrollView, attribute: .Leading, multiplier: 1, constant: 8)
            //let trailingConstraint = NSLayoutConstraint(item: label, attribute: .Trailing, relatedBy: .Equal, toItem: scrollView, attribute: .Trailing, multiplier: 1, constant: 8)
            //label.addConstraint(leadingConstraint)
            //label.addConstraint(trailingConstraint)

            label.textAlignment = NSTextAlignment.Center
            label.textColor = UIColor.whiteColor()
            label.numberOfLines = 2
            label.minimumScaleFactor = 0.5
            label.adjustsFontSizeToFitWidth = true
            label.text = fact
            scrollView.addSubview(label)
            x++
        }
        
        scrollView.contentSize = CGSizeMake(screenWidth * CGFloat(funFacts.count), scrollView.contentSize.height)
        
        efficiencyLabel.text = "#\(indexPath+1)"
        costLabel.text = "#\(cost[indexPath])"
        efficiencyInfo.text = "\(energyType[indexPath]) power retains \(efficiencyArray[indexPath])% of the energy input when converted to electricity"
        let yearlyCost:Double = (costArray[indexPath]*10.932).roundToPlaces(2)
        costInfo.text = "It costs $\(yearlyCost) per year to power an average american home"
        let kwhCost:Double = (costArray[indexPath]/1000).roundToPlaces(2)
        kwhCostLabel.text = "$\(kwhCost)"
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let svc = segue.destinationViewController as? WebViewController
        let svcDIY = segue.destinationViewController as? DIYViewController
        
        svc?.indexPath = indexPath
        svc?.bannerImg = bannerImg
        
        svcDIY?.bannerImg = bannerImg
        svcDIY?.titleString = energyType[indexPath]
        svcDIY?.funFacts = funFacts
        svcDIY?.indexPath = indexPath
    }
    
    
}
