//
//  DashboardModel.swift
//  Assignment1
//
//  Created by Vibhash Kumar on 26/06/24.
//

import Foundation
enum Gender {
    case male
    case female
}
struct DashboardModel: Identifiable, Hashable {
    var name: String
    var gender: Gender = .male
    let id = UUID().uuidString
}
