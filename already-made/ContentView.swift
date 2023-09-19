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

extension ContentView {
    private var timeCounting: some View {
        Group {
            HStack {
                Button(action: startCounting) {
                    Text("Start counting")
                }
                Button(action: stopCounting) {
                    Text("Stop counting")
                }
            }
            Text("Elapsed time: \(elapsedTime)")
        }
    }
    
    private func startCounting() {
        running = true
        startTime = Date()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                    if let startTime = self.startTime {
                        let currentTime = Date()
                        self.elapsedTime = currentTime.timeIntervalSince(startTime)
                    }
                }
    }
    
    private func stopCounting() {
        running = false
        timer?.invalidate()
    }
}

struct ContentView: View {
    @State private var money: String = "100000"
    @State private var perWhat: String = "month"
    @State private var currency: String = "PLN"
    
    @State private var elapsedTime = 0.0
    @State private var running: Bool = false
    @State private var startTime: Date?
    @State private var timer: Timer?
    
    var body: some View {
        VStack {
            inputSurvey
            timeCounting
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
