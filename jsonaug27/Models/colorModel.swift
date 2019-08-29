//
//  colorModel.swift
//  jsonaug27
//
//  Created by Tia Lendor on 8/27/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation
import UIKit

enum colorJSON: Error {
    case decodingError(Error)
}

struct Color: Codable {
    
    let colors: [colorInfo]
    
    static func getColorData(from data: Data) throws -> [colorInfo]{
        do {
            let color = try JSONDecoder().decode(Color.self, from: data)
            return color.colors
        } catch {
            throw colorJSON.decodingError(error)
        }
    }
   

}

struct colorInfo: Codable {
    
    let hex: HexInfo
    let rgb: RgbInfo
    let name: NameInfo
}

struct HexInfo: Codable {
    let value: String
    let clean: String
}

struct RgbInfo: Codable {
    let fraction: FractionInfo
    let r: Int
    let g: Int
    let b: Int
}

struct FractionInfo: Codable {
    let r: CGFloat
    let g: CGFloat
    let b: CGFloat
}

struct NameInfo: Codable {
    let value: String
}
