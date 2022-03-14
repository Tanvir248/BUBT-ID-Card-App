//
//  showIDVC.swift
//  BUBT ID-Cards
//
//  Created by Tanvir Rahman on 14.03.2022.
//

import UIKit
import WebKit
class showIDVC: UIViewController {
    @IBOutlet var WebPhoto : WKWebView!
    var photoId : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        WebPhoto.load(URLRequest(url: (URL(string: "https://bubt.mrshoikot.com/photos/\(photoId).jpeg")!)))
    }
    

    

}
