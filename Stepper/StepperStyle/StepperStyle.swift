//
//  StepperStyle.swift
//  Stepper
//
//  Created by Alex Stratu on 18/11/2022.
//

import SwiftUI

struct StepperConfiguration {
    var value: Binding<Int>
    var range: ClosedRange<Int>
    var label: Label
    
    internal struct Label: View {
        var _label: AnyView
        var body: some View { _label }
    }
}

protocol StepperStyle {
    associatedtype Body: View
    func makeBody(_ configuration: StepperConfiguration) -> Body
}

struct StepperStyleKey: EnvironmentKey {
    static let defaultValue: any StepperStyle = DefaultStepperStyle()
    static let capsule: any StepperStyle = CapsuleStepperStyle()
}

extension EnvironmentValues {
    var stepperStyle: any StepperStyle {
        get { self[StepperStyleKey.self] }
        set { self[StepperStyleKey.self] = newValue }
    }
}

extension View {
    func stepperStyle(_ style: some StepperStyle) -> some View {
        environment(\.stepperStyle, style)
    }
}
