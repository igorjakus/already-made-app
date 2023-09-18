//
//  ContentView.swift
//  already-made
//
//  Created by Igor  Jakus on 16/09/2023.
//

import SwiftUI

extension ContentView {
    private var inputSurvey: some View {
        HStack {
            Text("My")
            Picker("salary", selection: $perWhat) {
                Text("hourly").tag("hour")
                Text("weekly").tag("week")
                Text("monthly").tag("month")
                Text("annual").tag("year")
            }
            Text("salary is")
            TextField("amount of money", text: $money)
                .keyboardType(.numberPad)
                .onSubmit {
                    print(":D")
                }
                .frame(width: 80)
            Picker("currency", selection: $currency) {
                Text("PLN").tag("PLN")
                Text("€").tag("€")
                Text("$").tag("$")
                Text("£").tag("£")
            }.frame(width: 75)
        }
    }
}

struct ContentView: View {
    @State private var money: String = "100000"
    @State private var perWhat: String = "month"
    @State private var currency: String = "PLN"
    
    var body: some View {
        inputSurvey
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
