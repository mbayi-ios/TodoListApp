//
//  ListView.swift
//  TodoList
//
//  Created by Amby on 26/08/2022.
//

import SwiftUI

struct ListView: View {
    @State var items: [ String]  = [
        "this is the first title",
        "thtis is the thirds"
    ]
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
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

