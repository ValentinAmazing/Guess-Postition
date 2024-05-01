//
//  SliderRepresentation.swift
//  Guess Postition
//
//  Created by Valentin on 02.05.2024.
//

import SwiftUI

struct SliderRepresentation: UIViewRepresentable {
    @Binding var sliderValue: Float
    let action: () -> Void

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.sizeToFit()
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didSlided),
            for: .editingDidEnd
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = sliderValue
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue, action: action)
    }
}

extension SliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var sliderValue: Float
        let action: () -> Void

        init(sliderValue: Binding<Float>, action: @escaping () -> Void) {
            self._sliderValue = sliderValue
            self.action = action
        }
        
        @objc func didSlided(_ sender: UISlider) {
            sliderValue = sender.value
        }
    }
}

#Preview {
    SliderRepresentation(sliderValue: .constant(50)) {}
}
