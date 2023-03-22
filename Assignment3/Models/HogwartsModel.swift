//
//  HouseModel.swift
//  Assignment3
//
//  Created by Dave Regg on 3/22/23.
//

import Foundation

struct HogwartsResults: Codable {
    let hogwartsData: [HouseModel]
}

struct HouseModel: Codable, Identifiable {
    let id: String
    let name: String
    let houseColours: String
    let founder: String
    let animal: String
    let element: String
    let ghost: String
    let commonRoom: String
    let heads: [HeadModel]
    let traits: [TraitModel]
}
