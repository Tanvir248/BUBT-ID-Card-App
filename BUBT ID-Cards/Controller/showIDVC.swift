//
//  showIDVC.swift
//  BUBT ID-Cards
//
//  Created by Tanvir Rahman on 14.03.2022.
//

import UIKit
import WebKit
class showIDVC: UIViewController {
    var fetchedData = cardData()
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet var WebPhoto : WKWebView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var programLabel: UILabel!
    @IBOutlet weak var intakeLabel: UILabel!
    @IBOutlet weak var bloodGroupLabel: UILabel!
    var photoId : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        WebPhoto.load(URLRequest(url: (URL(string: "https://bubt.mrshoikot.com/photos/\(photoId).jpeg")!)))
        
        bloodGroupLabel.text = ("Blood Group:\(fetchedData.blood)")
        
    }
    

    

}
