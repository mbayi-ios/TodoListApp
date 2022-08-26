//
//  ItemModel.swift
//  TodoList
//
//  Created by Amby on 26/08/2022.
//

import Foundation
import SwiftUI

//immutable struct

struct ItemModel: Identifiable, Codable {
    let id: String 
    let title: String
    let isCompleted: Bool

    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }

    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

//ItemModel(title: <#T##String#>, isCompleted: <#T##Bool#>)
//ItemModel(id: <#T##String#>, title: <#T##String#>, isCompleted: <#T##Bool#>)
