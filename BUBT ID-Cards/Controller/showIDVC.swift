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
    var apiManager = cardDataManager()
    
    var photoId : String = ""
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.delegate = self
        
        WebPhoto.load(URLRequest(url: (URL(string: "https://bubt.mrshoikot.com/photos/\(photoId).jpeg")!)))
        
        
        apiManager.fetchCardData(idNo: photoId)
                
    }
    
    func didUpdateIDCard(transfer : transferData) {
        DispatchQueue.main.async {
            self.idLabel.text = "ID- \(transfer.id)"
            self.nameLabel.text = transfer.name
            self.programLabel.text = transfer.program
            self.bloodGroupLabel.text = "Blood Group:\(transfer.blood)"
            self.intakeLabel.text = transfer.intake
        }
        
    }

   

}
