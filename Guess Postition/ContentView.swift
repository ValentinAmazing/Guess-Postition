//
//  ContentView.swift
//  Guess Postition
//
//  Created by Valentin on 01.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = 50
    @State private var currentValue = Double.random(in: 0...100)
    
    var body: some View {
        VStack(spacing: 30) {
            //Slider
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            Slider(value: $currentValue) {
                Text("lol")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("100")
            }

            Button("Проверь меня", action: {})
                .font(.title)
            Button("Начать заново", action: {})
                .font(.title)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
