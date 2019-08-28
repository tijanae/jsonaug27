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

struct User: Codable {

    let results: [UserInfo]
    
    static func getUserData(from data: Data) throws -> [UserInfo]{
        do{
          let users = try JSONDecoder().decode(User.self, from: data)
            return users.results
        } catch {
            throw UserJSONError.decodingError(error)
        }
    }
}

struct UserInfo: Codable {
    
    let name: UserNameInfo
    let email: String
    let location: LocationInfo
    let dob: DobInfo
    let phone: String
}

struct UserNameInfo: Codable {
    
    let title: String
    let first: String
    let last: String
}

struct LocationInfo: Codable {
    let street: String
    let city: String
    let state: String
    
}

struct DobInfo: Codable {
    let date: String
    let age: Int
}
