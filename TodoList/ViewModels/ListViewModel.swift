//
//  ListViewModel.swift
//  TodoList
//
//  Created by Amby on 26/08/2022.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }

    let itemsKey: String = "items_list"

    init() {
        getItems()
    }

    func getItems() {
//        let newItems =  [
//            ItemModel(title: "This is the first title", isCompleted: false),
//            ItemModel(title: "this is the second title", isCompleted: true),
//            ItemModel(title: "This is the third title", isCompleted: false)
//
//        ]
//
//        items.append(contentsOf: newItems)

        guard let data = UserDefaults.standard.data(forKey: itemsKey)
        ,       let saveditems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }

        self.items = saveditems


    }

    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    func moveItem(from: IndexSet, to: Int ) {
        items.move(fromOffsets: from, toOffset: to)
    }

    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }

    func updateItem(item: ItemModel) {
//        if let index = items.firstIndex { (exitingItem) -> Bool in
//            return exitingItem.id == item.id
//        } {
//            //run this code
//        }

        if let index = items.firstIndex(where: { $0.id  == item.id}) {
            items[index] = item.updateCompletion()
        }
    }

    func saveItems() {
        if let enocdedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(enocdedData, forKey: itemsKey)
        }
    }
}
