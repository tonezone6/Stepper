//
//  StepperStyle-Capsule.swift
//  Stepper
//
//  Created by Alex Stratu on 18/11/2022.
//

import SwiftUI

struct CapsuleStepperStyle: StepperStyle {
    func makeBody(_ configuration: StepperConfiguration) -> some View {
       CapsuleStepper(configuration: configuration)
    }
}

extension StepperStyle where Self == CapsuleStepperStyle {
    static var capsule: CapsuleStepperStyle { .init() }
}

struct CapsuleStepper: View {
    var configuration: StepperConfiguration
    @Environment(\.controlSize) var controlSize
    
    var padding: Double {
        switch controlSize {
        case .mini: return 4
        case .small: return 6
        default: return 8
        }
    }
    
    var buttonSize: Double {
        switch controlSize {
        case .mini:    return 16
        case .small:   return 20
        case .regular: return 24
        case .large:   return 30
        default:       return 24
        }
    }
    
    var font: Font {
        switch controlSize {
        case .mini:    return .footnote
        case .small:   return .subheadline
        case .regular: return .callout
        case .large:   return .body
        default:       return .callout
        }
    }
    
    var body: some View {
        HStack {
            configuration.label
            Spacer()
            HStack {
                Button(action: decrease) {
                    Circle()
                        .fill(.tint)
                        .frame(width: buttonSize)
                        .overlay(Image(systemName: "minus"))
                }
                Text(configuration.value.wrappedValue.formatted())
                Button(action: increase) {
                    Circle()
                        .fill(.tint)
                        .frame(width: buttonSize)
                        .overlay(Image(systemName: "plus"))
                }
            }
            .font(font)
            .fontWeight(.semibold)
            .padding(padding)
            .foregroundColor(.white)
            .background(
                Capsule()
                    .fill(.tint)
                    .opacity(0.8)
            )
        }
        .buttonStyle(.plain)
    }
    
    func decrease() {
        guard configuration.value.wrappedValue > configuration.range.lowerBound else { return }
        configuration.value.wrappedValue -= 1
    }
    
    func increase() {
        guard configuration.value.wrappedValue < configuration.range.upperBound else { return }
        configuration.value.wrappedValue += 1
    }
}
