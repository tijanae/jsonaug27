//
//  colorModel.swift
//  jsonaug27
//
//  Created by Tia Lendor on 8/27/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation
import UIKit

enum colorJSON {
    case decodingError(Error)
}

struct Color: Codable {
    let name: String
    let hexValue: String
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
}
