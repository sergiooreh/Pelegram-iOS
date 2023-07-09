//
//  User.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 08.07.2023.
//

import Foundation


//Identifiable means that each item has a unique ID.
//Decodable means that it can be decoded - for example, we can transform a JSON object into this data model.
struct User: Identifiable, Decodable {
    var id: String
}
