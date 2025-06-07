//
//  ViewModelBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Weijian Duan on 2025/6/7.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    init() {
        print("ViewModel initialized")
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "Banana", count: 2)
        let fruit3 = FruitModel(name: "Strawberry", count: 3)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.fruitArray.append(contentsOf: [fruit1, fruit2, fruit3])
            self.isLoading = false
        }
    }
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
}

struct RandomScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
            VStack {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text("\(fruit.name) - \(fruit.count)")
                        .font(.headline)
                }
                
                Button {
                    fruitViewModel.fruitArray.append(FruitModel(name: "New Fruit", count: 0))
                } label: {
                    Text("Add Fruit")
                }
            }
        }
    }
}

struct ViewModelBootcamp: View {
    
    // @StateObject -> Use this on creation
    // @ObservedObject -> Use this when passing in from parent
    @StateObject var fruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView {
            List {
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Fruit List")
            .navigationBarItems(trailing:
                                    NavigationLink(destination: {
                RandomScreen(fruitViewModel: fruitViewModel)
            }, label: {
                Image(systemName: "arrow.right")
                    .font(.title)
            })
                                
            )
        }
    }
    
}

#Preview {
    //    RandomScreen()
    ViewModelBootcamp()
}
