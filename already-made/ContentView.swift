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
        perHour = countPerHour()
        running = true
        startTime = Date()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                    if let startTime = self.startTime {
                        let currentTime = Date()
                        self.elapsedTime = currentTime.timeIntervalSince(startTime)
                        alreadyMadeMoney = Int(perHour * elapsedTime / 3600)
                    }
                }
    }
    
    private func stopCounting() {
        running = false
        timer?.invalidate()
    }
}

extension ContentView {
    private var alreadyMadeView: some View {
        VStack {
            Text("Already made \(alreadyMadeMoney) \(currency)")
                .font(.title)
                .bold(true)
            Text("the value of \(alreadyMadeMoney/20) kebabs!")
        }.padding(.top)
    }
    
    private func countPerHour() -> Double {
        perHour = Double(money) ?? 0.0
        if perWhat == "day" {
            perHour /= 8
        } else if perWhat == "week" {
            perHour /= 8*5
        } else if perWhat == "month" {
            perHour /= 169
        } else if perWhat == "year" {
            perHour /= 169*12
        }
        return perHour
    }
}

struct ContentView: View {
    //inputSurvey
    @State private var money: String = "100000"
    @State private var perWhat: String = "month"
    @State private var currency: String = "PLN"
    
    // timeCounting
    @State private var elapsedTime: Double = 0.0
    @State private var running: Bool = false
    @State private var startTime: Date?
    @State private var timer: Timer?
    
    // alreadyMadeView
    @State private var perHour: Double = 0.0
    @State private var alreadyMadeMoney: Int = 225
    
    var body: some View {
        VStack {
            inputSurvey
            timeCounting
            alreadyMadeView
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
