//
//  ItemModel.swift
//  TodoList
//
//  Created by Amby on 26/08/2022.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
