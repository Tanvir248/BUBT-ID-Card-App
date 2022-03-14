//
//  JSONDecode.swift
//  BUBT ID-Cards
//
//  Created by Tanvir Rahman on 15.03.2022.
//

import Foundation

struct cardData: Codable {
    let id : String
    let name: String
    let program : String
    let intake : String
    let blood: String
}
