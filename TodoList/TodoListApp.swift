//
//  TodoListApp.swift
//  TodoList
//
//  Created by Amby on 26/08/2022.
//

import SwiftUI

@main
struct TodoListApp: App {

    @StateObject var listViewModel: ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
