//
//  ViewController.swift
//  BUBT ID-Cards
//
//  Created by Tanvir Rahman on 13.03.2022.
//

import UIKit

class ViewController: UIViewController {

    var sendID : String = " "
    
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchBox: UITextField!
    @IBOutlet weak var designView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
          // Do any additional setup after loading the view.
        
    }


    @IBAction func searchButtonPressed(_ sender: UIButton) {
    
        performSegue(withIdentifier: K.searchToCard , sender: self)
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        sendID = searchBox.text!
        if segue.identifier == K.searchToCard {
            let SendData = segue.destination as! showIDVC
            SendData.photoId = sendID
         
        }

    }
   
   

}

