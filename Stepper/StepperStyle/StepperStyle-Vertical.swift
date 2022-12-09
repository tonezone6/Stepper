//
//  StepperStyle-Vertical.swift
//  Stepper
//
//  Created by Alex S. on 08/12/2022.
//

import SwiftUI

struct VerticalStepperStyle: StepperStyle {
    func makeBody(_ configuration: StepperConfiguration) -> some View {
        HStack {
            configuration.label
            Spacer()
            HStack {
                Text(configuration.value.wrappedValue.formatted())
                    .monospacedDigit()
                
                VStack(spacing: 0) {
                    Image(systemName: "chevron.up")
                        .padding(4)
                    Image(systemName: "chevron.down")
                        .padding(4)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 4)
            .background {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(.regularMaterial)
            }
            .fontWeight(.semibold)
            .foregroundColor(.gray)
            .overlay {
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            configuration.value.wrappedValue += 1
                        }
                    Rectangle()
                        .fill(.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            configuration.value.wrappedValue -= 1
                        }
                }
            }
        }
    }
}

extension StepperStyle where Self == VerticalStepperStyle {
    static var vertical: VerticalStepperStyle { .init() }
}

private struct Preview: View {
    @State var value = 0
    
    var body: some View {
        `Stepper`(value: $value, in: 0...999) {
            Text("Quantity")
        }
        .stepperStyle(.vertical)
    }
}

struct VericalStepperStyle_Previews: PreviewProvider {
    static var previews: some View {
        Preview().padding()
    }
}

