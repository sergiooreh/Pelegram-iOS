//
//  FeedDto.swift
//  Pelegram
//
//  Created by Serhii Orekhivskyi on 09.07.2023.
//

import Foundation

struct FeedDto: Decodable, Hashable {
    var id: String
    var title: String
    var description: String? = nil
    var imageUrl: String? = nil
    var creator: String
}
