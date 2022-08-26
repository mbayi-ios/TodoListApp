//
//  ListView.swift
//  TodoList
//
//  Created by Amby on 26/08/2022.
//

import SwiftUI

struct ListView: View {
    @State var items: [ItemModel]  = [
        ItemModel(title: "This is the first title", isCompleted: false),
        ItemModel(title: "this is the second title", isCompleted: true),
        ItemModel(title: "This is the third title", isCompleted: false)

    ]
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}

