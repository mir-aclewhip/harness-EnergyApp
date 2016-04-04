//
//  ViewController.swift
//  harness2.0
//
//  Created by Mir Ali on 3/8/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var indexPath:Int!
    var currentImage:UIImage!
    var windFF:[String] = ["A wind turbine has as many as 8,000 different components", "The U.S. generates more wind energy than any other country except China", "A wind turbine blade can be up to 260 ft."]
    var geoFF:[String] = ["Humans have enjoyed geothermal energy in the form of hot springs for thousands of years", "Geothermal energy is often limited to areas near tectonic plate boundaries", "Geothermal energy generates <1% of US energy consumption"]
    var hydroFF:[String] = ["Hydropower generates ~9% of US energy consumption", "Every state uses hydropower for electricity"]
    var nukeFF:[String] = ["Nuclear energy powers the mars rover", "Nuclear power plants generate ~20% of U.S. electricity", "Nuclear energy comes from uranium, a nonrenewable resource that must be mined"]
    var solarFF:[String] = ["Solar energy is one of the most widely used renewable source of energy", "Space ships get part of their energy from solar power", "The largest solar power plant is in the Mojave Desert, California, covering ~1000 acres"]
    var bioFF:[String] = ["Energy can be generated from your food waste", "Biomass is anything that is or was alive"]
    var gasFF:[String] = ["Natural gas was formed deep under the earth about 100 million years ago", "There are more than 2.1 million miles of underground gas pipelines across the U.S.", "More than half of all the homes in the United States use natural gas"]
    var coalFF:[String] = ["The U.S. produces about 1 billion tons of coal annually", "Coal generates about 40 percent of the electricity in the United States", "Coal was formed about 300 million years ago", "Coal takes a million years to create"]
    var funFacts:[[String]]!
    
    var wind:UIImage = UIImage(named:"windBg")!
    var geo:UIImage = UIImage(named:"geothermalBg")!
    var hydro:UIImage = UIImage(named:"hydroBg")!
    var nuke:UIImage = UIImage(named:"nuclearBg")!
    var solar:UIImage = UIImage(named:"solarBG")!
    var bio:UIImage = UIImage(named:"biomassBg")!
    var gas:UIImage = UIImage(named:"naturalGasBg")!
    var coal:UIImage = UIImage(named:"coalBg")!
    var images:[UIImage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        funFacts = [windFF, geoFF, hydroFF, nukeFF, solarFF, bioFF, gasFF, coalFF]
        images = [wind, geo, hydro, nuke, solar, bio, gas, coal]
    }
    
    @IBAction func energyTypePressed(sender: UIButton) {
        indexPath = sender.tag
        //currentImage = sender.currentBackgroundImage
        performSegueWithIdentifier("Energy", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navVC = segue.destinationViewController as? UINavigationController
        let svc = navVC!.topViewController as? InfoViewController
        
        svc?.indexPath = indexPath
        svc?.bannerImg = images[indexPath]
        svc?.funFacts = funFacts[indexPath]
        
        //svc?.titleString = energyType[indexPath]
   
    }


}

