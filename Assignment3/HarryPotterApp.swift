//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct HarryPotterApp: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    LinkView()
                } label: {
                    Text("Label")
                }
                NavigationLink {
                    LinkView()
                } label: {
                    Text("Label")
                }
                NavigationLink {
                    LinkView()
                } label: {
                    Text("Label")
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Harry Potter App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HarryPotterApp()
    }
}

struct LinkView: View {
    var body: some View {
        Text("Hello World!")
    }
}
