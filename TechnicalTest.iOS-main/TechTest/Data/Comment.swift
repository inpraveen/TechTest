//
//  Comment.swift
//  TechTest
//
//  Created by WFX on 12/01/23.
//

import Foundation
struct Comment:Equatable, Codable {
    let id: Int
    let name: String
    let email: String
    let body: String
}
