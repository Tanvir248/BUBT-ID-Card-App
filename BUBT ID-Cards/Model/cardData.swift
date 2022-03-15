//
//  cardData.swift
//  BUBT ID-Cards
//
//  Created by Tanvir Rahman on 14.03.2022.
//

import Foundation


protocol TransferDataDelegate {
    func didUpdateIDCard(transfer : transferData)
}

struct cardDataManager {
    
    let cardUrl = "https://bubt.mrshoikot.com/api.php?id="
    
    var delegate: TransferDataDelegate?
    
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
            let dataTask = session.dataTask(with: myUrl) { (data, response, error) in
                if error != nil {
                    print(error!)
                      return
                }
                if let safeData = data {
                 //   let dataString = String(data: safeData, encoding: .utf8)
                //print(dataString!)
                   if let transfer = self.parseJSON(idCardData: safeData) {
                       
                        self.delegate?.didUpdateIDCard(transfer: transfer)
                    }
                }
                
            }
            
            
            
            //-> Start The task
        
            dataTask.resume()
        }
        
    }
    
    func parseJSON(idCardData: Data) -> transferData?{
        let decoder = JSONDecoder()
        do{
            let gainData = try decoder.decode(cardData.self, from: idCardData)
            let studentId = gainData.id
            let studentName = gainData.name
            let studentIntake = gainData.intake
            let studentProgram = gainData.program
            let studentBlood = gainData.blood
            
          let idData =   transferData(id: studentId, name: studentName, program: studentProgram, intake: studentIntake, blood: studentBlood)
            return idData
        }catch{
            print(error)
            return nil
        }
        
    }
    
    
}

