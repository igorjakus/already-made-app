//
//  ContentView.swift
//  already-made
//
//  Created by Igor  Jakus on 16/09/2023.
//

import SwiftUI

enum Time {
    case hour
    case month
    case year
}

struct ContentView: View {
    @State private var money: String = "0"
    @State private var whatTime: Time = .month
    
    var body: some View {
        VStack {
            Text("How much money you make for")
            HStack {
                Button {
                    whatTime = .hour
                } label: {
                    Text("hour")
                }
                Button {
                    whatTime = .month
                } label: {
                    Text("month")
                }
                Button {
                    whatTime = .year
                } label: {
                    Text("year")
                }
            }
            TextField("amount of money", text: $money)
            .keyboardType(.numberPad)
            .onSubmit {
                print(":D")
            }
            switch whatTime {
            case .hour:
                Text("hour")
            case .month:
                Text("month")
            case .year:
                Text("year")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
