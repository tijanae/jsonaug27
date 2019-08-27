//
//  userModel.swift
//  jsonaug27
//
//  Created by Tia Lendor on 8/27/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation

enum UserJSONError: Error {
    case decodingError(Error)
}

struct User {
    let name: String
    let email: String
    let address: String
    let phoneNumber: String
    let dateOfBirth: String
}
