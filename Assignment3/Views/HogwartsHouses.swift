//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct HogwartsHouses: View {
    @ObservedObject var hogwartsvm = HogwartsViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(hogwartsvm.houseData) { house in
                    NavigationLink {
                        HouseDetailView(house: house)
                    } label: {
                        Text(house.name)
                    }
                }
            }
            .task {
                await hogwartsvm.fetchData()
            }
            .listStyle(.grouped)
            .navigationTitle("Hogwarts Houses")
            .alert(isPresented: $hogwartsvm.hasError, error: hogwartsvm.error) {
                Text("")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HogwartsHouses()
    }
}
