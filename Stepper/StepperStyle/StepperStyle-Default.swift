//
//  StepperStyle-Default.swift
//  Stepper
//
//  Created by Alex Stratu on 18/11/2022.
//

import SwiftUI

struct DefaultStepperStyle: StepperStyle {
    func makeBody(_ configuration: StepperConfiguration) -> some View {
        Stepper(value: configuration.value, in: configuration.range) {
            configuration.label
        }
    }
}

extension StepperStyle where Self == CapsuleStepperStyle {
    static var `default`: DefaultStepperStyle { .init() }
}
