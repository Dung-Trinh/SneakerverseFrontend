//
//  DealsOverviewView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 03.12.20.
//

import SwiftUI

struct DealsOverviewView: View {
    let data = Array(1...1000).map {"Item\($0)"}
    let DealsOffer = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: DealsOffer, spacing: 20) {
                    ForEach(data, id:\.self){ item in
                        VStack{
                            Capsule()
                                .fill(Color.blue)
                                .frame(height:50)
                            Text(item)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }.navigationTitle("Sneaker Deals")
        }
    }
}

struct DealsOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        DealsOverviewView()
    }
}
