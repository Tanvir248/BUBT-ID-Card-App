//
//  cardData.swift
//  BUBT ID-Cards
//
//  Created by Tanvir Rahman on 14.03.2022.
//

import Foundation
 
struct cardManager {
    let cardUrl = "https://bubt.mrshoikot.com/api.php?id="
    
    func fetchCardData(idNo: String){
        let urlString = "\(cardUrl)\(idNo)"
    //print(urlString)
        requestForData(bubtData : urlString)
    }
    func requestForData(bubtData : String){
        // -> Create URl
        if let myUrl = URL(string: bubtData) {
            //-> Create a URLSession
            let session = URLSession(configuration: .default)
            
            //-> Give the session a task
            let datTask = session.dataTask(with: myUrl, completionHandler: handleData(data:response:error:))
            
            
            
            //-> Start The task
        
            datTask.resume()
        }
        
    }
    func handleData(data : Data?, response : URLResponse? , error : Error?) {
        if error != nil {
            print(error!)
        return
        }
        if let safeData = data {
         //   let dataString = String(data: safeData, encoding: .utf8)
        //print(dataString!)
          parseJSON(idCardData: safeData)
        }
        
    }
    
    func parseJSON(idCardData: Data){
        let decoder = JSONDecoder()
        do{
            let gainData = try decoder.decode(cardData.self, from: idCardData)
            //print(gainData.name)
        }catch{
            print(error)
        }
        
    }
    
}

