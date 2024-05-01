//
//  ContentView.swift
//  Guess Postition
//
//  Created by Valentin on 01.05.2024.
//

import SwiftUI

let range0_100 = Range(0...100)

struct ContentView: View {
    @State private var targetValue = Int.random(in: range0_100)
    @State private var currentValue = Int.random(in: range0_100)
    @State private var score = 0
    @State private var isShowAlert = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            Slider(
                value: $currentValue.float(),
                in: 0...100 //ClosedRange(range0_100, Float.init)
            ) {
                Text("lol")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("100")
            }

            Button("Проверь меня", action: checkMe)
                .font(.title)
                .alert("Your score", isPresented: $isShowAlert, actions: {}) {
                    Text("\(score)")
                }
            Button("Начать заново", action: startOver)
                .font(.title)
        }
        .padding()
    }
    
    private func startOver() {
        targetValue = Int.random(in: range0_100)
        currentValue = Int.random(in: range0_100)
        
    }
    
    private func checkMe() {
        score = computeScore()
        isShowAlert.toggle()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Binding where Value == Int {
    public func float() -> Binding<Float> {
        return Binding<Float>(get:{ Float(self.wrappedValue) },
            set: { self.wrappedValue = Int($0)})
    }
}
