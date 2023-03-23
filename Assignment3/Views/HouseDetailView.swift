//
//  HouseDetailView.swift
//  Assignment3
//
//  Created by Dave Regg on 3/23/23.
//

import SwiftUI

struct HouseDetailView: View {
    var house: HouseModel
    var body: some View {
        ScrollView {
            VStack {
                Text(house.name)
                    .font(.system(size: 32))
                    .bold()
                Image(house.animal)
                    .frame(width: 150, height: 150)
                    .padding()
                Section {
                    Text("House colors: \(house.houseColours)")
                    Text("House founder: \(house.founder)")
                    Text("House animal: \(house.animal)")
                    Text("House element: \(house.element)")
                    Text("House ghost: \(house.ghost)")
                    Text("House common room: \(house.commonRoom)")
                }
                Section {
                    Text("Traits:")
                    ForEach(house.traits) { trait in
                        Text(trait.name)
                    }
                    Text("Heads of House:")
                    ForEach(house.heads) { head in
                        Text("\(head.firstName) \(head.lastName)")
                    }
                }
            }
            .padding()
        }
    }
}
