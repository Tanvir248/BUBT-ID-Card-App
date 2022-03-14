//
//  showIDVC.swift
//  BUBT ID-Cards
//
//  Created by Tanvir Rahman on 14.03.2022.
//
import Foundation
import UIKit
import WebKit
class showIDVC: UIViewController, TransferDataDelegate {
    
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet var WebPhoto : WKWebView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var programLabel: UILabel!
    @IBOutlet weak var intakeLabel: UILabel!
    @IBOutlet weak var bloodGroupLabel: UILabel!
    var photoId : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // cardManager.delegate = self
        WebPhoto.load(URLRequest(url: (URL(string: "https://bubt.mrshoikot.com/photos/\(photoId).jpeg")!)))
        
        
        
    }
    

    func didUpdateIDCard(transfer: transferData){
        bloodGroupLabel.text = ("Blood Group:\(transfer.blood)")
        print(transfer.blood)
        print(transfer.program)
    }

}
