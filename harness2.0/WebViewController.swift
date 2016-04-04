//
//  WebViewController.swift
//  harness2.0
//
//  Created by Mir Ali on 3/15/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var container:UIView!

    var webView:WKWebView!
    var indexPath:Int!
    var bannerImg:UIImage!
    
    var sites:[String] = ["https://en.wikipedia.org/wiki/Wind_power", "https://en.wikipedia.org/wiki/Geothermal_energy", "https://en.wikipedia.org/wiki/Hydroelectricity", "https://en.wikipedia.org/wiki/Nuclear_power", "https://en.wikipedia.org/wiki/Solar_power", "https://en.wikipedia.org/wiki/Biomass", "https://en.wikipedia.org/wiki/Natural_gas", "https://en.wikipedia.org/wiki/Coal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        webView = WKWebView()
        container.addSubview(webView)

    }


    override func viewDidAppear(animated: Bool) {
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame
        
        loadRequest(sites[indexPath])
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let svc = segue.destinationViewController as? InfoViewController
        svc?.indexPath = indexPath
        svc?.bannerImg = bannerImg
    }
    
    func loadRequest(urlStr:String) {
        let url = NSURL(string: urlStr)!
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
}
